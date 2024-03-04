import 'package:admin_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constan.dart';
import '../manager/sign_up/sign_up_cubit.dart';
import '../model/signup_model.dart';
import '../widget/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          SignUpCubit cubit = SignUpCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    key: cubit.signUpFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        MyTextField(
                            errorMessage:  "Please insert your name",
                            controller: cubit.nameController,
                            prefixIcon: const Icon(Icons.person),
                            hintText:  "Enter Your Name",
                            keyboardType: TextInputType.name,
                            obscureText: false
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                            errorMessage:  "Please insert your phone",
                            controller: cubit.phoneController,
                            prefixIcon: const Icon(Icons.phone),
                            hintText: "+02********",
                            keyboardType: TextInputType.phone,
                            obscureText: false),
                        SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                            errorMessage:  "Please insert an email",
                            controller: cubit.emailSignUpController,
                            prefixIcon: const Icon(Icons.email_outlined),
                            hintText: '@gmail.com',
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false),
                        SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                          errorMessage:  "Please insert a password",
                          controller: cubit.passwordSignUpController,
                          prefixIcon: const Icon(Icons.lock),
                          hintText: '**********',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: cubit.isShowSignUpPassword,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.changeSignUpPasswordVisibility();
                            },
                            child: Visibility(
                              visible: !cubit.isShowSignUpPassword,
                              replacement: const Icon(Icons.visibility_off),
                              child: const Icon(Icons.visibility),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 70,
                        ),
                         CustomButton(
                          height: 42,
                          width: 220,
                              onTap: () {
                                if (cubit.signUpFormKey.currentState!.validate()) {
                                  cubit.signup(context,
                                      signupModel: SignupModel(
                                          token: '',
                                          email: cubit.emailSignUpController.text,
                                          name: cubit.nameController.text,
                                          type: Constants.userType,
                                          image: '',
                                          phone: cubit.phoneController.text),
                                      password: cubit.passwordSignUpController.text);
                                }
                              },
                              text: "Sign Up",
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

