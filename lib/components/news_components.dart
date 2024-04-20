import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_details_model.dart';
import 'package:news_app/screen/news_details_screen.dart';
import 'package:provider/provider.dart';

import '../provider/basic_provider.dart';

class NewsDataScreen extends StatefulWidget {
  @override
  NewsDataScreenState createState() => NewsDataScreenState();
}

class NewsDataScreenState extends State<NewsDataScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BasicProvider>(builder: (context, providerObj, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: providerObj.articleList!.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          Article mData = providerObj.articleList![index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsScreen(articleModel: providerObj.articleList[index])));
            },
            child: Card(
              color: providerObj.isdark ? Colors.grey.shade700 : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(imageUrl: '${mData.urlToImage}', height: 100, width: 100, fit: BoxFit.fill)),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            '${mData.author}',
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              '${mData.title}',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
                              softWrap: true,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("${mData.publishedAt!.day.toString()} : ${mData.publishedAt!.hour.toString()}",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    providerObj.addToBookMarkList(mData);
                                  },
                                  icon: Icon(
                                    Icons.bookmark,
                                    size: 20,
                                    color: providerObj.bookMarkList.contains(mData)
                                        ? Theme.of(context).primaryColor
                                        : providerObj.isdark
                                            ? Colors.white
                                            : Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
