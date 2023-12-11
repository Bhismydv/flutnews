import 'package:flutnews/service/fetch_news.dart';
import 'package:flutnews/styles/app_color.dart';
import 'package:flutnews/ui/components/app_appbar.dart';
import 'package:flutnews/ui/components/app_searchbar.dart';
import 'package:flutnews/utlis/constants.dart';
import 'package:flutter/material.dart';

import '../components/app_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> news;

  @override
  void initState() {
  news = fetchNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var w= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppAppbar(),
      body: Column(
        children: [
          AppSearchBar(),

          Expanded(
            child: SizedBox(
                width: w,
                child: FutureBuilder<List>(
                  future: fetchNews(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ContentBox(
                              url: snapshot.data![index]['url'],
                              imageurl:
                              snapshot.data![index]['urlToImage'] ?? AppConstants.imageurl,
                              title: snapshot.data![index]['title'],
                              time: snapshot.data![index]['publishedAt'],
                              description: snapshot.data![index]
                              ['description']
                                  .toString(),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
