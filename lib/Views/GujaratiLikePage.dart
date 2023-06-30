import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/JsonData.dart';
import '../Provider/ThemeProvider.dart';

class GujaratilikedPage extends StatefulWidget {
  final List<GujaratishlokData> like;
  GujaratilikedPage({
    required this.like,
  });

  @override
  State<GujaratilikedPage> createState() => _GujaratilikedPageState();
}

class _GujaratilikedPageState extends State<GujaratilikedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" પ્રિય શ્લોક"),
      ),
      body: (widget.like.isEmpty)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "તમને કોઈ શ્લોક ગમ્યો નથીै",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: widget.like.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  GujaratishlokData verseData = widget.like[index];

                  return Padding(
                    padding: const EdgeInsets.all(16),
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
                      child: Column(
                        children: [
                          Text(
                            verseData.verseNumber.toString(),
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: (Provider.of<ThemeProvider>(context,
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
                            verseData.description,
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
                            verseData.meaning,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 21),
                          ),
                          Divider(
                            color: (Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .isdark ==
                                    true)
                                ? CupertinoColors.white
                                : Colors.black,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.like.remove(verseData);
                              });
                            },
                            child: Column(
                              children: [
                                Icon(CupertinoIcons.delete),
                                Text("Delete"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
