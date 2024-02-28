class IllnessModel {
  String? name;
  String? symptoms;
  String? identification;
  String? reasons;
  String? whentoseedoctor;
  String? treatment;


  IllnessModel(
      {required this.symptoms,
      required this.name,
      required this.identification,
      required this.reasons,
      required this.whentoseedoctor,
      required this.treatment,


      });

  IllnessModel.fromJson(Map<String, dynamic>? json, this.name) {
    symptoms = json!['Symptoms'];
    identification = json['identification'];
    reasons = json['reasons'];
    whentoseedoctor = json['whentoseedoctor'];
    treatment = json['treatment'];

  }

  Map<String, dynamic> toMap({required id}) => {
        'name': name,
        'Symptoms': symptoms,
        'identification': identification,
        'reasons': reasons,
        'whentoseedoctor': whentoseedoctor,
        'treatment': treatment,
      };
}
