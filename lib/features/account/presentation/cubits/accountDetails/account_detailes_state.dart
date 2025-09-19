part of 'account_detailes_cubit.dart';

@immutable
sealed class AccountDetailesState {}

final class AccountDetailesInitial extends AccountDetailesState {}

final class AccountDetailesLoading extends AccountDetailesState {}

final class AccountDetailesSuccess extends AccountDetailesState {
  final User user;

  AccountDetailesSuccess(this.user);
}

final class AccountDetailesError extends AccountDetailesState {
  final String message;

  AccountDetailesError(this.message);
}
