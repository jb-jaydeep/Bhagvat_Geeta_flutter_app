import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Model/JsonData.dart';
import '../Model/LanguageModel.dart';
import '../Provider/ThemeProvider.dart';

class ShlokPage extends StatefulWidget {
  const ShlokPage({super.key});

  @override
  State<ShlokPage> createState() => _ShlokPageState();
}

class _ShlokPageState extends State<ShlokPage> {
  @override
  Widget build(BuildContext context) {
    JsonData Post = ModalRoute.of(context)!.settings.arguments as JsonData;

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: (Lang == "Gujarati")
            ? Text("પ્રકરણ - ${Post.id}")
            : (Lang == "Hindi")
                ? Text("अध्याय - ${Post.id}", textAlign: TextAlign.justify)
                : Text(
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify,
                    "Chapter - ${Post.id}"),
        centerTitle: true,
      ),
      body: (Lang == "Hindi")
          ? FutureBuilder(
              future: rootBundle.loadString("jsonData/shlok.json"),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  String data = snapshot.data!;
                  Map decodedData = jsonDecode(data);
                  List myData = decodedData["Data"];

                  List<shlokData> ShlokData =
                      myData.map((e) => shlokData.formMap(Data: e)).toList();
                  var filteredData =
                      ShlokData.where((item) => Post.id == item.chapter_id)
                          .toList();
                  return ListView.separated(
                    itemCount: filteredData.length,
                    separatorBuilder: (context, index) =>
                        Container(), // Empty container as separator
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: (Provider.of<ThemeProvider>(context,
                                                listen: false)
                                            .isdark ==
                                        true)
                                    ? CupertinoColors.white
                                    : Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: h,
                            width: w,
                            child: Column(
                              children: [
                                Text(
                                    "कविता -${filteredData[i].verse_order.toString()}"),
                                Divider(
                                  color: (Provider.of<ThemeProvider>(context,
                                                  listen: false)
                                              .isdark ==
                                          true)
                                      ? CupertinoColors.white
                                      : Colors.black,
                                ),
                                Text(
                                  filteredData[i].text,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Divider(
                                  color: (Provider.of<ThemeProvider>(context,
                                                  listen: false)
                                              .isdark ==
                                          true)
                                      ? CupertinoColors.white
                                      : Colors.black,
                                ),
                                Text(
                                  filteredData[i].transliteration,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  Text("Error");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : (Lang == "Gujarati")
              ? FutureBuilder(
                  future: rootBundle.loadString("jsonData/GujaratiJson.json"),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      String GujaratiData = snapshot.data!;
                      Map decodedData = jsonDecode(GujaratiData);
                      List GujData = decodedData["Data"];

                      List<GujaratishlokData> GujaratiShlokData =
                          GujData.map((e) => GujaratishlokData.formMap(Data: e))
                              .toList();
                      var filteredData =
                          GujaratiShlokData.where((item) => Post.id == item.id)
                              .toList();
                      return ListView.separated(
                        itemCount: filteredData.length,
                        separatorBuilder: (context, index) =>
                            Container(), // Empty container as separator
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: (Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .isdark ==
                                            true)
                                        ? CupertinoColors.white
                                        : Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: h,
                                width: w,
                                child: Column(
                                  children: [
                                    Text(
                                        "શ્લોક -${filteredData[i].verseNumber.toString()}"),
                                    Divider(
                                      color: (Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .isdark ==
                                              true)
                                          ? CupertinoColors.white
                                          : Colors.black,
                                    ),
                                    Text(
                                      filteredData[i].description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Divider(
                                      color: (Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .isdark ==
                                              true)
                                          ? CupertinoColors.white
                                          : Colors.black,
                                    ),
                                    Text(
                                      filteredData[i].meaning,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 21),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      Text("Error");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              : FutureBuilder(
                  future: rootBundle.loadString("jsonData/shlok.json"),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      String data = snapshot.data!;
                      Map decodedData = jsonDecode(data);
                      List myData = decodedData["Data"];

                      List<shlokData> ShlokData = myData
                          .map((e) => shlokData.formMap(Data: e))
                          .toList();
                      var filteredData =
                          ShlokData.where((item) => Post.id == item.chapter_id)
                              .toList();
                      return ListView.separated(
                        itemCount: filteredData.length,
                        separatorBuilder: (context, index) =>
                            Container(), // Empty container as separator
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: (Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .isdark ==
                                            true)
                                        ? CupertinoColors.white
                                        : Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: h,
                                width: w,
                                child: Column(
                                  children: [
                                    Text(
                                      filteredData[i].title,
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: (Provider.of<ThemeProvider>(
                                                        context,
                                                        listen: false)
                                                    .isdark ==
                                                true)
                                            ? CupertinoColors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      filteredData[i].description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                    Divider(
                                      color: (Provider.of<ThemeProvider>(
                                                      context,
                                                      listen: false)
                                                  .isdark ==
                                              true)
                                          ? CupertinoColors.white
                                          : Colors.black,
                                    ),
                                    Text(
                                      filteredData[i].word_meanings,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 21),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      Text("Error");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
    );
  }
}
