import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../manager/books/books_cubit.dart';
import '../model/book_model.dart';
import '../style/colors.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class AddBooks extends StatelessWidget {
 const AddBooks({super.key, });


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => BooksCubit(),
        child: BlocConsumer<BooksCubit, BooksState>(
        listener: (context, state) {
    },
    builder: (context, state) {
      BooksCubit cubit = BooksCubit.get(context);

      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration:  BoxDecoration(
                        color: ColorsAsset.kWhite,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: ColorsAsset.kBrown,width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.15),
                          )
                        ]
                    ),
                    child: InkWell(
                      onTap: () async{
                        await cubit.addImage();
                      },
                      child: cubit.url != null ? Image.network(cubit.url!) :Image.asset('assets/add_image.png')

                    ),
                  ),
                  const SizedBox(height: 70),
                  MyTextField(
                     controller: cubit.addNameController,
                    hintText:  'Add Name',
                    keyboardType: TextInputType.text,
                    errorMessage: "Please add Name",
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: cubit.addAuthorController,
                    hintText:  'Add Author Name',
                    keyboardType: TextInputType.text,
                    errorMessage: "Please add author Name",
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: cubit.addDescriptionController,
                    hintText:  'Add Description',
                    keyboardType: TextInputType.text,
                    errorMessage: "Please add Description",
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async{
                     await cubit.addPdf();
                    },
                    child: Text('Pick PDF', style: TextStyle(color: ColorsAsset.kBrown, fontSize: 20)),
                  ),
                  // Image.network(cubit.urlPdf ?? ''),
                  const SizedBox(height: 55),
                  CustomButton(
                    text:  "Add Book",
                    height: 42,
                    width: 220,
                    onTap: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.addBook(
                          bookModel: BookModel(
                              name: cubit.addNameController.text,
                              author: cubit.addAuthorController.text,
                              description: cubit.addDescriptionController.text,
                              image:cubit.url!,
                            download: cubit.urlPdf!,

                        ),
                        );

                        cubit.clearForm();


                      }

                    },
                  ),

                ],
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
