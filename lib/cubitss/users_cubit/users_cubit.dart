import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/repositories/users_repo.dart';
import 'package:mad_mom_mag/data/models/user_model/user_model.dart';

part 'users_state.dart';

class ProfileCubit extends Cubit<UserProfileState> {
  ProfileCubit({required this.profileRepository}) : super(ProfileInitial());

  final ProfileRepository profileRepository;

  getUserData() async {
    emit(ProfileLoadingState());
    UniversalData response = await profileRepository.getUserData();
    if (response.error.isEmpty) {
      emit(ProfileSuccessState(userModel: response.data as UserModel));
    } else {
      emit(ProfileErrorState(errorText: response.error));
    }
  }
}