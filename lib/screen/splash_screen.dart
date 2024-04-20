import 'package:flutter/material.dart';
import 'package:news_app/provider/basic_provider.dart';
import 'package:news_app/screen/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BasicProvider basicProvider = Provider.of<BasicProvider>(context, listen: false);
      basicProvider.getArticleList();
    });
    Future.delayed(Duration(seconds: 8), () async {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => HomeScreen()),
        ModalRoute.withName('/'),
      );
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.brown.shade200,
                    Colors.orange.shade50,
                  ],
                )),
                child: FlutterLogo())));
  }
}

// Center(child: FlutterLogo(size: 160.0)),