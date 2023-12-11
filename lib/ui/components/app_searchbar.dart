import 'package:flutnews/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSearchBar extends StatefulWidget {
  static TextEditingController searchController = TextEditingController(text: '');
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const SizedBox(width: 10,),
                  Expanded(
                      child: TextField(
                        controller: AppSearchBar.searchController,
                        decoration: InputDecoration(
                          hintText: 'Search here...',
                          hintStyle: GoogleFonts.lato(),
                          border: InputBorder.none,
                        ),
                  )),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.bgColor, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
