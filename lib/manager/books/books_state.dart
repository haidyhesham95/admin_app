part of 'books_cubit.dart';

@immutable
abstract class BooksState {}

class BooksInitial extends BooksState {}
class Loading extends BooksState {}
class AddBooks extends BooksState {}
class AddImage extends BooksState {}
class AddPdf extends BooksState {}


