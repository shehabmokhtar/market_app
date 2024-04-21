import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/functions/get_list_from_json.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/branch/presentation/model_view/branch_cubit/branch_cubit.dart';
import 'package:market_app/modules/categories_and_products/data/models/category_model.dart';
import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';
import 'package:market_app/modules/categories_and_products/data/repository/categories_repo/categories_repo_imp.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitial());

  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<CategoryModel> customerCategories = [];
  List<SubCategoriesAndProductsModel>? customerSubCategoriesAndProducts = [];

  //? Get customer categories
  Future<void> getCustomerCategories() async {
    emit(GetCategoriesLoadingState());
    // Clear categories list before fill it again
    customerCategories.clear();
    try {
      // Get near branch firt
      await sl<BranchCubit>().getNearBranch();
      // Get categories in the close it branch
      var result =
          await categoriesRepo.getCategories(brnachId: branchInfo!.id!);
      // Manage result
      result.fold((left) {
        customerCategories = getListFromJson(
            data: left.data, fromJson: (e) => CategoryModel.fromJson(e));
        print(customerCategories[0].id);
        emit(GetCategoriesSuccessState());
      }, (right) => emit(GetCategoriesErrorState(right.errorMessage)));
    } catch (e) {
      emit(GetCategoriesErrorState(e.toString()));
    }
    //! 24-30 June 2024
  }

  // Get sub categories and products for a spaceific branch
  Future<void> getSubCategoriesAndProducts(
      {required int branchCategoryId}) async {
    emit(GetSubCategoriesAndProductsLoadingState());
    // Clear sub categories and products list before fill it again
    if (customerSubCategoriesAndProducts!.isNotEmpty) {
      customerSubCategoriesAndProducts!.clear();
    }

    // Get subb categories and products from categories repo class
    var result = await categoriesRepo.getSubCategoriesAndProducts(
        branchCategoryId: branchCategoryId);
    // Manage result
    result.fold((left) {
      customerSubCategoriesAndProducts = getListFromJson(
          data: left.data,
          fromJson: (e) => SubCategoriesAndProductsModel.fromJson(e));
      emit(GetSubCategoriesAndProductsSuccessState());
    },
        (right) =>
            emit(GetSubCategoriesAndProductsErrorState(right.errorMessage)));
  }
}
