import 'dart:io';
import 'package:admin_app/style/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:admin_app/model/book_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  static BooksCubit get(context) => BlocProvider.of(context);
  TextEditingController addNameController = TextEditingController();
  TextEditingController addAuthorController = TextEditingController();
  TextEditingController addDescriptionController = TextEditingController();

  void clearForm() {
    addNameController.clear();
    addAuthorController.clear();
    addDescriptionController.clear();
    url = null;
    urlPdf = null;

  }
  late File file;
  String? url , urlPdf;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  List<BookModel> book = [];
  List<String> bookId = [];
  bool loadBook = false;
  bool loadPdf = false;
  bool loadImage = false;


  void addBook({required BookModel bookModel, String? id,required BuildContext context}) async {
    loadBook = true;
    emit(Loading());

    try {
      await FirebaseFirestore.instance.collection("books").add(bookModel.toMap(id: id));
      book.add(BookModel.fromJson(bookModel.toMap(id: id)));
      emit(Success());
      Fluttertoast.showToast(msg: "Added Successfully", backgroundColor: ColorsAsset.kBrown,);

    } catch (e) {
      emit(BookError(e.toString()));
    } finally {
      loadBook = false;
    }
  }

  Future<void> addImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      loadImage = true;
      emit(ImageLoading());

      try {
        file = File(image.path);
        var imageName = basename(image.path);
        var refStorage = FirebaseStorage.instance.ref().child('books/$imageName');

        await refStorage.putFile(file);
        url = await refStorage.getDownloadURL();
        emit(AddImage());
      } catch (e) {
        emit(BookError(e.toString()));
      } finally {
        loadImage = false;
      }
    }
  }

  Future<void> addPdf() async {
    FilePickerResult? document = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (document != null) {
      loadPdf = true;
      emit(LoadPdf());

      try {
        file = File(document.files.single.path!);
        var pdfName = basename(document.files.single.path!);
        var refStorage = FirebaseStorage.instance.ref().child('pdf/$pdfName');

        await refStorage.putFile(file);
        urlPdf = await refStorage.getDownloadURL();
        emit(AddPdf());
      } catch (e) {
        emit(BookError(e.toString()));
      } finally {
        loadPdf = false;
      }
    }
  }
}




