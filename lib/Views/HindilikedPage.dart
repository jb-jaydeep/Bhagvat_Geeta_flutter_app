import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/JsonData.dart';
import '../Provider/ThemeProvider.dart';

class HindilikedPage extends StatefulWidget {
  final List<shlokData> likeVerses;
  HindilikedPage({
    required this.likeVerses,
  });

  @override
  State<HindilikedPage> createState() => _HindilikedPageState();
}

class _HindilikedPageState extends State<HindilikedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" पसंद किये हुए श्लोक"),
      ),
      body: (widget.likeVerses.isEmpty)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "आपने कोई भी श्लोक पसंद की नहीं है",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: widget.likeVerses.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  shlokData verseData = widget.likeVerses[index];

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
                            verseData.verse_order.toString(),
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
                            verseData.text,
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
                            verseData.transliteration,
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
                                widget.likeVerses.remove(verseData);
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
