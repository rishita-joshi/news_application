import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/basic_provider.dart';
import 'package:news_app/screen/news_details_screen.dart';
import 'package:provider/provider.dart';

import '../model/news_details_model.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BasicProvider>(builder: (context, providerObj, child) {
      return Scaffold(
        backgroundColor: providerObj.isdark ? Colors.grey.shade900 : Colors.white,
        appBar: AppBar(
          backgroundColor: providerObj.isdark ? Colors.grey.shade900 : Colors.white,
          title: Text(
            "BookMark",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: providerObj.bookMarkList.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                Article mData = providerObj.bookMarkList![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => NewsDetailsScreen(articleModel: providerObj.bookMarkList![index])));
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
                              Text(
                                '${mData.author}',
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
                              ),
                              SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 1.8,
                                  child: Text('${mData.title}', style: Theme.of(context).textTheme.bodySmall, softWrap: true, maxLines: 5)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "${mData.publishedAt!.day.toString()} : ${mData.publishedAt!.hour.toString()}",
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.bookmark,
                                          size: 20,
                                          color: Theme.of(context).primaryColor,
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
            )
          ],
        ),
      );
    });
  }
}
