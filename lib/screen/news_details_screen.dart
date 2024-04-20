import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_details_model.dart';
import 'package:news_app/provider/basic_provider.dart';
import 'package:provider/provider.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.articleModel});
  final Article articleModel;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BasicProvider>(builder: (context, providerObj, child) {
      return Scaffold(
        backgroundColor: providerObj.isdark ? Colors.grey.shade900 : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: widget.articleModel.urlToImage ?? "",
                      height: MediaQuery.of(context).size.height * 0.35,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomLeft, colors: [Colors.black38, Colors.transparent])),
                  ),
                  Positioned(
                      top: 40,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                  Positioned(
                    top: 50,
                    right: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.forward,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 200,
                    right: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text("27"),
                        SizedBox(width: 10),
                        Icon(Icons.visibility, color: Colors.white),
                        SizedBox(width: 10),
                        Text("916"),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.articleModel.title ?? "",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(widget.articleModel.content ?? ""),
              )
            ],
          ),
        ),
      );
    });
  }
}
