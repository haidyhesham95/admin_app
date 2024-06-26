import 'package:admin_app/model/illness_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../style/colors.dart';

part 'add_illness_state.dart';

class AddIllnessCubit extends Cubit<AddIllnessState> {
  AddIllnessCubit() : super(AddIllnessInitial());


  static AddIllnessCubit get(context) => BlocProvider.of(context);
  TextEditingController addNameController = TextEditingController();
  TextEditingController addIdentificationController = TextEditingController();
  TextEditingController addTreatmentController = TextEditingController();
  TextEditingController addSymptomsController = TextEditingController();
  TextEditingController addReasonsController = TextEditingController();
  TextEditingController addSeeDoctorController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  List<IllnessModel> illness = [];
  List<String> articleId = [];

  void addIllness(
      {required IllnessModel illnessModel, String? id, required BuildContext context}) async {
    emit(Loading());
    try {
      await FirebaseFirestore.instance
          .collection("Diseases")
          .add(illnessModel.toMap(id: id))
          .then((value) {
        illness.add(
            IllnessModel.fromJson(illnessModel.toMap(id: id), value.id));
        emit(Success());
        Fluttertoast.showToast(msg: "Added Successfully", backgroundColor: ColorsAsset.kBrown,);

      });
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

}




