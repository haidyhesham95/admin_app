part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class ShowPasswordInSignUp extends SignUpState {}

class IsLoading extends SignUpState {}
class Success extends SignUpState {}
