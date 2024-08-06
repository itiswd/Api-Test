import 'package:api_test/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_test/cubit/user_state.dart';
import 'package:api_test/models/sign_in_model.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(UserInitial());
  final UserRepo userRepo;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;

  //Pick Image
  pickProfilePicture(XFile image) {
    profilePic = image;
    emit(UploadPicture());
  }

  //Sign Up
  signUp() async {
    emit(SignUpLoading());
    final response = await userRepo.signUp(
      name: signUpName.text,
      email: signUpEmail.text,
      phone: signUpPhoneNumber.text,
      password: signUpPassword.text,
      confirmPassword: confirmPassword.text,
      profilePic: profilePic!,
    );

    response.fold(
      (errorMessage) => emit(SignUpFailure(errMessage: errorMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

  //Sign in
  signIn() async {
    emit(SignInLoading());
    final response = await userRepo.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    response.fold(
      (errorMessage) => emit(SignInFailure(errMessage: errorMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }

  //Get User Data
  getUserProfile() async {
    emit(GetUserDataLoading());
    final response = await userRepo.getUserProfile();
    response.fold(
      (errorMessage) => emit(GetUserDataFailure(errMessage: errorMessage)),
      (user) => emit(GetUserDataSuccess(user: user)),
    );
  }
}
