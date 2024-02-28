import 'package:flutter/cupertino.dart';

import '../style/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.width, this.height, required this.text, this.onTap});
  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorsAsset.kBrown,
          borderRadius: BorderRadius.circular(18),
        ),
        child:  Center(child: Text(text,
          style: TextStyle(color: ColorsAsset.kWhite,fontSize: 18),)),
      ),
    );
  }
}
