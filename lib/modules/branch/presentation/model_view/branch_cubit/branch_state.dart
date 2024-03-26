part of 'branch_cubit.dart';

@immutable
sealed class BranchStates {}

final class BranchInitial extends BranchStates {}

//?    Get Near Branch      //
// Get near branch loading state
final class GetNearBranchLoadingState extends BranchStates {}

// Get near branch success state
final class GetNearBranchSuccessState extends BranchStates {}

// Get near branch error state
final class GetNearBranchErrorState extends BranchStates {
  final String errorMessage;
  GetNearBranchErrorState(this.errorMessage);
}
