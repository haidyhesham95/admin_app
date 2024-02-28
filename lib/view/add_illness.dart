import 'package:admin_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constan.dart';
import '../manager/illness/add_illness_cubit.dart';
import '../model/illness_model.dart';
import '../widget/custom_textfield.dart';



class AddIllness extends StatelessWidget {
  const AddIllness({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => AddIllnessCubit(),
        child: BlocConsumer<AddIllnessCubit, AddIllnessState>(
        listener: (context, state) {
    },
    builder: (context, state) {
      AddIllnessCubit cubit = AddIllnessCubit.get(context);
      return Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     MyTextField(
                       controller: cubit.addNameController,
                            hintText:  'Add Name',
                            keyboardType: TextInputType.text,
                            errorMessage: "Please add Name",
                          ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: cubit.addIdentificationController,
                          hintText:  'Add Identification',
                          keyboardType: TextInputType.text,
                          errorMessage: "Please add identification",
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: cubit.addReasonsController,
                          hintText:  'Add Reasons',
                          keyboardType: TextInputType.text,
                          errorMessage: "Please add reasons",
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: cubit.addSymptomsController,
                          hintText:  'Add Symptoms',
                          keyboardType: TextInputType.text,
                          errorMessage: "Please add symptoms",
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: cubit.addTreatmentController,
                          hintText:  'Add Treatment',
                          keyboardType: TextInputType.text,
                          errorMessage: "Please add treatment",
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: cubit.addSeeDoctorController,
                          hintText:  'When to see doctor',
                          keyboardType: TextInputType.text,
                          errorMessage: "Please add when to see doctor",
                        ),

                        const SizedBox(height: 55),
                        CustomButton(
                          text:  "Add Illness",
                          height: 42,
                          width: 220,
                          onTap: () {

                            if (cubit.formKey.currentState!.validate()) {
                              cubit.addIllness(
                                illnessModel: IllnessModel(
                                    name: cubit.addNameController.text,
                                    identification: cubit.addIdentificationController.text,
                                    reasons: cubit.addReasonsController.text,
                                    symptoms: cubit.addSymptomsController.text,
                                    treatment: cubit.addTreatmentController.text,
                                    whentoseedoctor: cubit.addSeeDoctorController.text,
                                  //  id: illnessModel!.id
                                ),

                              );

                              cubit.addNameController.clear();
                              cubit.addIdentificationController.clear();
                              cubit.addReasonsController.clear();
                              cubit.addSymptomsController.clear();
                              cubit.addTreatmentController.clear();
                              cubit.addSeeDoctorController.clear();
                            }

                          },
                        ),

                      ],

                    ),
                  ),

                              ),
              ),
            );
            }

        ),
    );






  }
}