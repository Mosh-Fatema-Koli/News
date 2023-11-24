
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/styles.dart';

class HeaderListTitle extends StatelessWidget {
  const HeaderListTitle({
    super.key, required this.title, this.color,  this.onTap,
  });
  final String title;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style:CustomTextStyle.h3(fontWeight: FontWeight.bold,color:color),),
       onTap==null?const SizedBox() :InkWell(
          onTap: onTap,
          child: Material(
            shape:const CircleBorder(),
            color:color,
            child:  Icon(Icons.chevron_right,color:!Get.isDarkMode?Colors.white:Colors.black,),
          ),
        )
      ],
    );
  }
}
