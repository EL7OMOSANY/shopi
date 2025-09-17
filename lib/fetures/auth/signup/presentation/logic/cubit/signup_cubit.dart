import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopi/core/constants/shared_pref_keys.dart';
import 'package:shopi/core/enums/role_enum.dart';
import 'package:shopi/core/helpers/shared_pref_helper.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/utils/image_pick.dart';
import 'package:shopi/fetures/auth/auth_repos/auth_repos.dart';
import 'package:shopi/fetures/auth/signup/data/models/sign_up_request.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupRepo) : super(SignupInitial());
  final AuthRepos _signupRepo;
  String userRole = AppRole.customer.name;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? avatar = ImagePick().imagePathToApiAvater(
    XFile(
      SharedPref().getString(SharedPrefKeys.userImage) ??
          "com.example.shopi/cache/eeba4ee0-4061-4da1-af56-a4d399dba2f6/1000407625.png",
    ),
  );

  Future<void> signUp() async {
    try {
      final response = await _signupRepo.signUp(
        signUpRequestBody: SignUpRequest(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
      //log response role for debug

      log("SignUp Cubit Response Role: $response");
      response.when(
        success: (data) {
          emit(SignupSuccess());
        },
        failure: (error) {
          emit(SignupError(message: error));
        },
      );
    } catch (error) {
      log("Pls check your internet connection or try again later");
      emit(SignupError(message: error.toString()));
    }
  }
}
