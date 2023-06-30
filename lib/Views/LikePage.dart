import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/JsonData.dart';
import '../Provider/ThemeProvider.dart';

class LikedVersesPage extends StatefulWidget {
  final List<shlokData> likedVerses;
  LikedVersesPage({
    required this.likedVerses,
  });

  @override
  State<LikedVersesPage> createState() => _LikedVersesPageState();
}

class _LikedVersesPageState extends State<LikedVersesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Verses"),
      ),
      body: (widget.likedVerses.isEmpty)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "You have not liked any verse",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: widget.likedVerses.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  shlokData verseData = widget.likedVerses[index];

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
                            verseData.title,
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
                            verseData.word_meanings,
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
                                widget.likedVerses.remove(verseData);
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
