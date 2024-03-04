class SignupModel {
  String? name;
  String? email;
  String ? phone;
  String ? id;
  String ?type;
  String ?image;
  String ? token;

  SignupModel({required this.email, required this.name,required this.phone,required this.type, this.id,required this.image,required this.token});

  SignupModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    type = json['type'];
    image = json['image'];
    token = json['token'];

  }

  Map<String, dynamic> toMap({required id}) => {
    'id': id,
    'name':name,
    'email': email,
    'phone': phone,
    'type': type,
    'image': image,
    'token': token,
  };
}