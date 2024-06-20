import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../model/signup_model.dart';
import '../../style/colors.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isLoadingSignUp = false;









  Future<void> signup(
      context, {
        required SignupModel signupModel,
        required String password,
      }) async {
    isLoadingSignUp = true;
    emit(IsLoading());
    String uid;
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: signupModel.email!, password: password).then((value) {
      uid = value.user!.uid;
      FirebaseFirestore.instance.collection("users").doc(uid).set(signupModel.toMap(id: uid)).then((value) {
        FirebaseFirestore.instance.collection("doctors").doc(uid).set(signupModel.toMap(id: uid));
      }).then((value) {
        emailSignUpController.clear();
        nameController.clear();
        phoneController.clear();
        passwordSignUpController.clear();

        emit(Success());
        Fluttertoast.showToast(msg: "Added Successfully", backgroundColor: ColorsAsset.kBrown,);

            });
    }).catchError((onError) {
      isLoadingSignUp = false;
      emit(IsLoading());
      Fluttertoast.showToast(msg: onError.message.toString(), backgroundColor: ColorsAsset.kBrown, );
    });
  }



  bool isShowSignUpPassword = true;

  void changeSignUpPasswordVisibility() {
    isShowSignUpPassword = !isShowSignUpPassword;
    emit(ShowPasswordInSignUp());
  }
}
