import 'package:bloc/bloc.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/profile/customer_profile/data/models/user_model.dart';
import 'package:market_app/modules/profile/customer_profile/data/repository/user_repo/user_repo_impl.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitial());

  UserModel? userModel;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());

    // function response
    var result = await sl<UserRepo>().getUserData();

    result.fold((left) {
      userModel = UserModel.fromJson(left.data);
      emit(GetUserDataSuccessState());
    }, (right) => GetUserDataErrorState(right.errorMessage));
  }
}
