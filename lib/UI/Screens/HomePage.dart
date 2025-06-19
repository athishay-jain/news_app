import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Data/Online/news_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticlesDataModel> mArticles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi(selectedTopic);
  }
bool isNotLoading = true;
  int selectedTopic = 0;
  List<String> mTopics = [
    "All",
    "Science",
    "Bitcoin",
    "War",
    "Technology"
  ];

  @override
  Widget build(BuildContext context) {
 // print("The ui rebuild model data is ${mArticles[0].articles[0].title}");
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: mArticles.isNotEmpty
          ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    style: TextStyle(
                        color: Color(0xff667582),
                        fontFamily: "newsreader",
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search articles",
                        hintStyle: TextStyle(
                            color: Color(0xff667582),
                            fontFamily: "newsreader",
                            fontWeight: FontWeight.w600),
                        fillColor: Color(0xfff2f2f5),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Breaking news",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff212121),
                        fontFamily: "newsreader",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  height: 180,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          mArticles[0].articles[0].urlToImage,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Color(0xffF1F3F4),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 80,
                          width: 350,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.withAlpha(180),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: [0.5, 1]),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                        ),
                        bottom: 0,
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            mArticles[0].articles[0].title,
                            style: TextStyle(
                                fontFamily: "newsreader",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white),
                            textAlign: TextAlign.center,maxLines: 2,overflow:TextOverflow.fade ,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        child: Card(
                          color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6,),
                              child: Text("Source : ${mArticles[0].articles[1].source.name}",style: TextStyle(fontSize: 10,fontFamily: "newsreader",fontWeight: FontWeight.w700,color: Colors.white),),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Trending news",
                    style: TextStyle(
                        fontSize: 26,
                        color: Color(0xff212121),
                        fontFamily: "newsreader",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ListView.builder(
                      itemCount: mTopics.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {
                              selectedTopic = index;
                              getApi(selectedTopic);
                              mArticles.clear();
                              setState(() {});

                            },
                            child: Chip(
                              label: Text(
                                mTopics[index],
                                style: TextStyle(
                                  color: selectedTopic == index
                                      ? Color(0xffffffff)
                                      : Color(0xff212121),
                                ),
                              ),
                              backgroundColor: selectedTopic == index
                                  ? Color(0xff1A73E8)
                                  : Color(0xffF1F3F4),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 30,),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: mArticles[0].articles.length,
                      itemBuilder: (_,index){
                    var articles = mArticles[0].articles[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: SizedBox(
                        height: 120,
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Color(0xff667582),width: 0.8)),
                          tileColor: Color(0xfff2f2f5),
                          leading: Container(
                            width: 100,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(articles.urlToImage,scale: 10),fit: BoxFit.cover)),
                          ),
                          title: Text(articles.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily:"newsreader"),maxLines: 3,),
                          subtitle: Text(articles.publishedAt,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily:"newsreader"),),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          )
          : Center(
              child: CircularProgressIndicator(
                color: Color(0xff1A73E8),
              ),
            ),
    );
  }

  void getApi(int topic) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ccf5b1fd2d354cab98072feccf4e819b";

    if(topic == 1){
      url ="https://newsapi.org/v2/everything?q=science&apiKey=ccf5b1fd2d354cab98072feccf4e819b";
    }else if(topic == 2){
      url ="https://newsapi.org/v2/everything?q=bitcoin&apiKey=ccf5b1fd2d354cab98072feccf4e819b";
    }else if(topic == 3){
      url ="https://newsapi.org/v2/everything?q=war&apiKey=ccf5b1fd2d354cab98072feccf4e819b";
    }else if(topic == 4){
      url = "https://newsapi.org/v2/everything?q=technology&apiKey=ccf5b1fd2d354cab98072feccf4e819b";
    }
    else{
      url ="https://newsapi.org/v2/top-headlines?country=us&apiKey=ccf5b1fd2d354cab98072feccf4e819b";
    }
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      dynamic data = jsonDecode(res.body);
      mArticles.add(ArticlesDataModel.fromJson(data));
      print(" the Top Headline is ${mArticles[0].articles[1].title}");
      print("  ${mArticles[0].articles[1].content}");
      setState(() {});
    }
  }
}
