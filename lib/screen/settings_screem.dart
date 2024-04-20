import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/setting_item_widget.dart';
import 'package:news_app/provider/basic_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingFragment extends StatefulWidget {
  @override
  _SettingFragmentState createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BasicProvider>(builder: (context, providerObj, child) {
      return Scaffold(
        backgroundColor: providerObj.isdark ? Colors.grey.shade900 : Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: providerObj.isdark ? Colors.grey.shade900 : Colors.white,
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 16),
                Card(
                  color: providerObj.isdark ? Colors.grey.shade700 : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              maxRadius: 35,
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1713499944234-efc9209b5f0a?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D"),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Andrew Desuza',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black),
                                ),
                                Text(
                                  'abcxyz@gmail.com',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Sign Out',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15, color: Theme.of(context).primaryColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: providerObj.isdark ? Colors.grey.shade700 : Colors.white,
                  child: Column(children: [
                    SettingsItemWidget(
                      textColor: providerObj.isdark ? Colors.white : Colors.black,
                      titleText: "Dark Mode",
                      onTapFunction: () async {
                        //   appStore.toggleDarkMode(value: false);
                        // } else {
                        //   appStore.toggleDarkMode(value: true);
                        // }
                      },
                      trailingWidget: SizedBox(
                        height: 20,
                        width: 30,
                        child: Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: providerObj.isdark,
                          onChanged: (bool value) {
                            providerObj.swapTheme();
                          },
                        ),
                      ),
                    ),
                    SettingsItemWidget(
                      titleText: "Notification",
                      onTapFunction: () async {},
                      trailingWidget: SizedBox(
                        height: 20,
                        width: 30,
                      ),
                      textColor: providerObj.isdark ? Colors.white : Colors.black,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Account", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: providerObj.isdark ? Colors.grey.shade700 : Colors.white,
                  child: Column(
                    children: [
                      SettingsItemWidget(
                        textColor: providerObj.isdark ? Colors.white : Colors.black,
                        titleText: "Address",
                        onTapFunction: () {
                          //
                        },
                        trailingWidget: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      SettingsItemWidget(
                        textColor: providerObj.isdark ? Colors.white : Colors.black,
                        titleText: "Payment",
                        onTapFunction: () {
                          // PaymentScreen().launch(context);
                        },
                        trailingWidget: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      SettingsItemWidget(
                        textColor: providerObj.isdark ? Colors.white : Colors.black,
                        titleText: "Security",
                        onTapFunction: () {
                          //
                        },
                        trailingWidget: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Privacy and Security",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: providerObj.isdark ? Colors.white : Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: providerObj.isdark ? Colors.grey.shade700 : Colors.white,
                  child: SettingsItemWidget(
                    textColor: providerObj.isdark ? Colors.white : Colors.black,
                    titleText: "Private Account",
                    onTapFunction: () {
                      //
                    },
                    trailingWidget: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
