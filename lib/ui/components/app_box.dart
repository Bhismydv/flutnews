import 'package:flutnews/styles/app_color.dart';
import 'package:flutnews/ui/components/app_divider.dart';
import 'package:flutnews/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'app_bottomsheet.dart';

class ContentBox extends StatelessWidget {
  final String imageurl, title, time, description, url;
  const ContentBox(
      {Key? key,
        required this.imageurl,
        required this.title,
        required this.time,
        required this.description,
        required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.bgColor,
            child: Row(
              children: [
               Container(
                 height: 60,
                 width: 60,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                     image: DecorationImage(
                         image: NetworkImage(imageurl), fit: BoxFit.cover)
                 ),
               ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                          color: AppColors.white, size: 16, text: title),
                    const  SizedBox(height: 5),
                      NormalText(
                          color: AppColors.lightwhite, size: 12, text: time),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        AppDivider()
      ],
    );
  }
}