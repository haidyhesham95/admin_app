import 'package:admin_app/style/colors.dart';
import 'package:admin_app/view/add_books.dart';
import 'package:admin_app/view/add_illness.dart';
import 'package:admin_app/view/signup.dart';
import 'package:flutter/material.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.only(top:40),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar:  TabBar(
            indicatorColor:ColorsAsset.kBrown,
            dividerColor: Colors.transparent,
            unselectedLabelColor: ColorsAsset.kBrown.withOpacity(0.4),
            labelColor: ColorsAsset.kBrown,

            tabs:  [
              Tab(
                  text:  "Add illness"
              ),
              Tab(
                  text:  "Add book"
              ),
              Tab(
                  text:  "Add user"
              ),
            ],
          ),
          body:  const  TabBarView(
            children: [
              AddIllness(),
              AddBooks(),
              SignUpPage(),

            ],
          ),


        ),
      ),
    );
  }
}
