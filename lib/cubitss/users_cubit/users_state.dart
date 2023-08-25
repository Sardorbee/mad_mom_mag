part of 'users_cubit.dart';



@immutable
abstract class UserProfileState extends Equatable {}

class ProfileInitial extends UserProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadingState extends UserProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSuccessState extends UserProfileState {
  final UserModel userModel;

  ProfileSuccessState({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class ProfileErrorState extends UserProfileState {
  final String errorText;

  ProfileErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}