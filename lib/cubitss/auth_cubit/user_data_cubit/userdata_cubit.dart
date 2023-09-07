import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mad_mom_mag/data/models/user_model/field_keys.dart';

import 'package:mad_mom_mag/data/models/user_model/user_model.dart';

part 'userdata_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit()
      : super(
          UserDataState(
            userModel: UserModel(
              password: "",
              username: "",
              email: "",
              avatar: '',
              contact: "",
              gender: "",
              profession: '',
              role: "",
            ),
            errorText: "",
          ),
        );

  updateCurrentUserField({
    required UserFieldKeys fieldKey,
    required dynamic value,
  }) {
    UserModel currentUser = state.userModel;

    if (value is String) {
      switch (fieldKey) {
        case UserFieldKeys.username:
          currentUser = currentUser.copyWith(username: value);
          break;
        case UserFieldKeys.avatar:
          currentUser = currentUser.copyWith(avatar: value);
          break;
        case UserFieldKeys.gender:
          currentUser = currentUser.copyWith(gender: value);
          break;
        case UserFieldKeys.role:
          currentUser = currentUser.copyWith(role: value);
          break;
        case UserFieldKeys.profession:
          currentUser = currentUser.copyWith(profession: value);
          break;
        case UserFieldKeys.password:
          currentUser = currentUser.copyWith(password: value);
          break;
        case UserFieldKeys.contact:
          currentUser = currentUser.copyWith(contact: value);
          break;
        case UserFieldKeys.email:
          currentUser = currentUser.copyWith(email: value);
          break;
      }
    }
    debugPrint("UserData: ${currentUser.toString()}");

    emit(state.copyWith(userModel: currentUser));
  }

  bool canRegister() {
    UserModel user = state.userModel;
// ! Must Display Errors
    return user.contact.length >= 9 &&
        user.username.isNotEmpty &&
        user.avatar.isNotEmpty &&
        user.email.isNotEmpty &&
        user.password.isNotEmpty &&
        user.profession.isNotEmpty &&
        user.gender.isNotEmpty;
  }

  clearData() {
    emit(
      UserDataState(
        userModel: UserModel(
          password: "",
          username: "",
          email: "",
          avatar: '',
          contact: "",
          gender: "",
          profession: '',
          role: "",
        ),
        errorText: "",
      ),
    );
  }
}
