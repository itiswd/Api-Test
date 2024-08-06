import 'package:api_test/models/user_model.dart';

class UserState {}

//Initial
final class UserInitial extends UserState {}

//UploadPicture
final class UploadPicture extends UserState {}

//SignUp
final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

//SignIn
final class SignInSuccess extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

//GetUserData
final class GetUserDataSuccess extends UserState {
  final UserModel user;

  GetUserDataSuccess({required this.user});
}

final class GetUserDataLoading extends UserState {}

final class GetUserDataFailure extends UserState {
  final String errMessage;

  GetUserDataFailure({required this.errMessage});
}
