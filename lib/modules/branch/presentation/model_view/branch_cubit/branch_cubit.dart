import 'package:bloc/bloc.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/branch/data/models/branch_model.dart';
import 'package:market_app/modules/branch/data/repository/branch_repo/branch_repo_imp.dart';
import 'package:meta/meta.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchStates> {
  BranchCubit() : super(BranchInitial());

  BranchRepo branchRepo = BranchRepo();

// Get near branch
  Future<void> getNearBranch() async {
    emit(GetNearBranchLoadingState());
    // result
    var result = await branchRepo.getNearBranch(
        lat: sl<AddressesCubit>().currentLatutude!,
        lng: sl<AddressesCubit>().currentLongtude!,
        subDistrictId: sl<AddressesCubit>().currentSubDistrictId ?? '');

    // Manage response
    result.fold((left) {
      branchInfo = BranchModel.fromJson(left.data);
      emit(GetNearBranchSuccessState());
    }, (right) => emit(GetNearBranchErrorState(right.errorMessage)));
  }
}
