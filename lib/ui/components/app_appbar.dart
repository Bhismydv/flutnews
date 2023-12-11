import 'package:flutnews/styles/app_color.dart';
import 'package:flutnews/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
   AppAppbar({Key? key}):
         preferredSize = Size.fromHeight(50),
         super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          children: [
            FancyText(text: 'Flutt', size: 20, color: AppColors.primary),
            NormalText(text: 'News', size: 20, color: AppColors.lightwhite)
          ],
        ),
      ),
    );
  }

  @override
 final Size  preferredSize;

}
