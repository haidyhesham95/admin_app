part of 'add_illness_cubit.dart';

@immutable
abstract class AddIllnessState {}

class AddIllnessInitial extends AddIllnessState {}
class Loading extends AddIllnessState {}
class Addllness extends AddIllnessState {}
class Success extends AddIllnessState {}
class Error extends AddIllnessState {
  Error(String string);
}

