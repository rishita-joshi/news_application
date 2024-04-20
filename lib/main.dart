import 'package:flutter/material.dart';
import 'package:news_app/provider/basic_provider.dart';
import 'package:news_app/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var isDarkTheme;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  isDarkTheme = sp.getBool("darkTheme") ?? false;
  return runApp(ChangeNotifierProvider(create: (context) => BasicProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<BasicProvider>(context);

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => BasicProvider())],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: themeProvider.getTheme(isDarkTheme),
          home: SplashScreen(),
        ));
  }
}
