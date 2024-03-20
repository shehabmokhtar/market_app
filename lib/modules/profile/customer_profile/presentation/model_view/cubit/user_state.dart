part of 'user_cubit.dart';

@immutable
sealed class UserStates {}

final class UserInitial extends UserStates {}

final class GetUserDataLoadingState extends UserStates {}

final class GetUserDataSuccessState extends UserStates {}

final class GetUserDataErrorState extends UserStates {
  final String errorMessage;
  GetUserDataErrorState(this.errorMessage);
}
