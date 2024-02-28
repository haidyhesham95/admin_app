class BookModel {
  String? name;
  String? description;
  String ? author;
  String ? image;
  String ? download;

  BookModel({required this.description, required this.name,required this.author,required this.image, this.download,});

  BookModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    description = json['description'];
    author = json['author'];
    image = json['image'];
    download = json['download'];

  }

  Map<String, dynamic> toMap({required id}) => {
    'name': name,
    'description': description,
    'author': author,
    'image': image,
    'download': download,
  };
}
