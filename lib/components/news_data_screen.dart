import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/news_components.dart';
import 'package:news_app/provider/basic_provider.dart';
import 'package:news_app/screen/news_details_screen.dart';
import 'package:provider/provider.dart';

import '../model/news_model.dart';

class NBAllNewsComponent extends StatefulWidget {
  @override
  NBAllNewsComponentState createState() => NBAllNewsComponentState();
}

class NBAllNewsComponentState extends State<NBAllNewsComponent> with SingleTickerProviderStateMixin {
  PageController? pageController;
  int pageIndex = 0;
  TabController? tabController;

  List<String> mBannerItems = [
    "https://images.unsplash.com/photo-1713365747492-7918df1942b7?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1711542452521-fd713c7e1034?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1711542452521-fd713c7e1034?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];

  List<NBNewsDetailsModel> mNewsList = [];
  List<NBNewsDetailsModel> mTechNewsList = [], mFashionNewsList = [], mSportsNewsList = [], mScienceNewsList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   init();
  // }

  // Future<void> init() async {
  //   pageController = PageController(initialPage: pageIndex, viewportFraction: 0.9);
  // }

  // @override
  // void setState(fn) {
  //   if (mounted) super.setState(fn);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tabController = TabController(length: 5, vsync: this);
    mNewsList.forEach((element) {
      if (element.categoryName == 'Technology') {
        mTechNewsList.add(element);
      } else if (element.categoryName == 'Fashion') {
        mFashionNewsList.add(element);
      } else if (element.categoryName == 'Sports') {
        mSportsNewsList.add(element);
      } else if (element.categoryName == 'Science') {
        mScienceNewsList.add(element);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BasicProvider>(builder: (context, providerObj, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "News App",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
              ),
            ),
            TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  text: 'All News',
                ),
                Tab(text: 'Technology'),
                Tab(text: 'Fashion'),
                Tab(text: 'Sports'),
                Tab(text: 'Science'),
              ],
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
              unselectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 250,
              child: PageView(
                controller: pageController,
                children: List.generate(
                  mBannerItems.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: CachedNetworkImage(
                          imageUrl: mBannerItems[index]!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
                onPageChanged: (value) {},
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: DotsIndicator(
                dotsCount: mBannerItems.length,
                position: 1,
                decorator: DotsDecorator(
                  color: Theme.of(context).colorScheme.secondary, // Inactive color
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            NewsDataScreen()
          ],
        ),
      );
    });
  }
}
