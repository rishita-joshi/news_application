import 'dart:convert';

import '../model/news_details_model.dart';
import 'package:http/http.dart' as http;

class HttpConfig {
  String apiUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0a7bdfe011a74df6b521cbddba406b33";

  Future<List<Article>> getArticle() async {
    List<Article> productList = [];
    var request = http.Request('GET', Uri.parse(apiUrl));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var parsed = jsonDecode(await response.stream.bytesToString());
      NewsModel newsModel = NewsModel.fromJson(parsed);
      for (int i = 0; i < newsModel.articles!.length; i++) {
        productList.add(newsModel.articles![i]);
      }
      print("======= main length>${productList.length}");
      return productList;
    } else {
      print(response.reasonPhrase);

      return Future.error("Somthing Went Wrong");
    }
  }
}
