// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mad_mom_mag/data/local/shared_prefs.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/models/user_model/user_model.dart';
import 'package:mad_mom_mag/data/repositories/auth_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> checkLoggedState() async {
    await Future.delayed(const Duration(seconds: 1));
    if (authRepository.getToken().isEmpty) {
      emit(AuthUnAuthenticatedState());
    } else {
      emit(AuthLoggedState());
    }
  }

  Future<void> logOutUser() async {
    await StorageRepository.deleteString("token");
    emit(AuthUnAuthenticatedState());
  }

  Future<void> signInWithPasswordAndGmail(String gmail, String password) async {
    emit(AuthLoadingState());
    UniversalData universalData = await authRepository.loginUser(
      gmail: gmail,
      password: password,
    );
    if (universalData.error.isEmpty) {
      emit(AuthLoggedState());
    } else {
      emit(AuthErrorState(errorText: universalData.error));
    }
  }

  Future<void> sendCodeToGmail(String gmail, String password) async {
    emit(AuthLoadingState());
    UniversalData universalData = await authRepository.sendCodeToGmail(
      gmail: gmail,
      password: password,
    );
    if (universalData.error.isEmpty) {
      emit(AuthSendCodeSuccessState());
    } else {
      emit(AuthErrorState(errorText: universalData.error));
    }
  }

  Future<void> registerUser(UserModel userModel) async {
    emit(AuthLoadingState());
    UniversalData universalData =
        await authRepository.registerUser(userModel: userModel);
    if (universalData.error.isEmpty) {
      emit(AuthRegisteredState());
    } else {
      emit(AuthErrorState(errorText: universalData.error));
    }
  }

  Future<void> sendConfirmationCode(String code) async {
    emit(AuthLoadingState());
    UniversalData universalData = await authRepository.confirmCode(code: code);
    if (universalData.error.isEmpty) {
      emit(AuthConfirmCodeSuccessState());
    } else {
      if (universalData.error ==
          "You are already authorized! Siz allaqachon avtorizatsiya qilgansiz!") {
        emit(AuthConfirmCodeAlreadyThereState());
      }
      emit(AuthErrorState(errorText: universalData.error));
    }
  }
}
