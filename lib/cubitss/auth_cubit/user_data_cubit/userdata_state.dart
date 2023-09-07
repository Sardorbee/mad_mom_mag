part of 'userdata_cubit.dart';

class UserDataState extends Equatable {
  final String errorText;
  final UserModel userModel;

  const UserDataState({
    required this.userModel,
    required this.errorText,
  });

  UserDataState copyWith({
    String? errorText,
    UserModel? userModel,
  }) =>
      UserDataState(
        userModel: userModel ?? this.userModel,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [errorText, userModel];
}
