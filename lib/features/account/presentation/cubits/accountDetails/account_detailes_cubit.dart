import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../auth/data/models/sign_up_model.dart';
import '../../../data/repos/account_repo.dart';

part 'account_detailes_state.dart';

class AccountDetailesCubit extends Cubit<AccountDetailesState> {
  final AccountRepo accountRepo;
  SignUpModel? currentUser;
  AccountDetailesCubit({required this.accountRepo})
    : super(AccountDetailesInitial());

  Future<void> fetchUserData() async {
    emit(AccountDetailesLoading());
    final result = await accountRepo.getUserData();
    result.fold(
      (error) => emit(AccountDetailesError(error.errorModel.message)),
      (signUpModel) {
        if (signUpModel.user != null) {
          emit(AccountDetailesSuccess(signUpModel.user!));
        } else {
          emit(AccountDetailesError('No user data available'));
        }
      },
    );
  }

  Future<void> updateUserData({
    required String name,
    required String email,
  }) async {
    final userId = currentUser?.user?.sId;
    if (userId == null) {
      emit(AccountDetailesError('User ID is null. Cannot update user data.'));
      return;
    }

    emit(AccountDetailesLoading());
    final result = await accountRepo.updateUserData(
      userId: userId,
      name: name,
      email: email,
    );

    result.fold(
      (error) => emit(
        AccountDetailesError(error.errorModel.message ?? 'Failed to update'),
      ),
      (signUpModel) {
        currentUser = signUpModel;
        if (signUpModel.user != null) {
          emit(AccountDetailesSuccess(signUpModel.user!));
        } else {
          emit(AccountDetailesError('Failed to update user data'));
        }
      },
    );
  }
}
