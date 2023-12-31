import 'package:bhagvad_geeta_flutter_app/Model/LanguageModel.dart';
import 'package:bhagvad_geeta_flutter_app/Provider/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/JsonData.dart';
import 'GujaratiLikePage.dart';
import 'HindilikedPage.dart';
import 'LikePage.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    JsonData Post = ModalRoute.of(context)!.settings.arguments as JsonData;
    return Scaffold(
      appBar: AppBar(
        title: (Lang == "Gujarati")
            ? Text("પ્રકરણ - ${Post.id}")
            : (Lang == "Hindi")
                ? Text("अध्याय - ${Post.id}", textAlign: TextAlign.justify)
                : Text(
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify,
                    "Chapter - ${Post.id}"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (val) {
              if (val == "hin") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HindilikedPage(likeVerses: likeVerses),
                  ),
                );
              } else if (val == "guj") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GujaratilikedPage(like: like),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LikedVersesPage(likedVerses: likedVerses),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'hin',
                child: Text("Hindi liked verse"),
              ),
              PopupMenuItem(
                value: 'guj',
                child: Text("Gujarati liked verse"),
              ),
              const PopupMenuItem(
                value: 'eng',
                child: Text("English liked verse"),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (Lang == "Gujarati")
                ? Text(
                    Post.GujName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : (Lang == "Hindi")
                    ? Text(
                        Post.Hindiname,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: h * 0.02),
                        textAlign: TextAlign.justify,
                        Post.EngName),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Post.image_name,
                  ),
                ),
              ),
              height: h * 0.2,
              width: w,
            ),
            Divider(
              color:
                  (Provider.of<ThemeProvider>(context, listen: false).isdark ==
                          false)
                      ? Colors.black87
                      : Colors.white,
            ),
            SizedBox(
              height: h * 0.25,
              child: SingleChildScrollView(
                child: (Lang == "Gujarati")
                    ? Text(Post.chapter_summary_gujarati)
                    : (Lang == "Hindi")
                        ? Text(Post.chapter_summary_hindi,
                            textAlign: TextAlign.justify)
                        : Text(Post.chapter_summary,
                            textAlign: TextAlign.justify),
              ),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("ShlokPage", arguments: Post);
              },
              style: ButtonStyle(
                backgroundColor:
                    (Provider.of<ThemeProvider>(context, listen: false)
                                .isdark ==
                            false)
                        ? const MaterialStatePropertyAll(Colors.black87)
                        : const MaterialStatePropertyAll(CupertinoColors.white),
              ),
              child: (Lang == "Gujarati")
                  ? Text(
                      "સંપૂર્ણ પ્રકરણ જોવા માટે ટેપ કરોે",
                      style: TextStyle(
                        color:
                            (Provider.of<ThemeProvider>(context, listen: false)
                                        .isdark ==
                                    true)
                                ? CupertinoColors.black
                                : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : (Lang == "Hindi")
                      ? Text(
                          "पूरा अध्याय देखने के लिए टैप करें",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: (Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .isdark ==
                                    true)
                                ? CupertinoColors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          style: TextStyle(
                              color: (Provider.of<ThemeProvider>(context,
                                              listen: false)
                                          .isdark ==
                                      true)
                                  ? CupertinoColors.black
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                          textAlign: TextAlign.justify,
                          "Tap For view full chapter"),
            ),
            RadioListTile(
                value: "Gujarati",
                title: const Text("Gujarati"),
                groupValue: Lang,
                onChanged: (val) {
                  setState(() {
                    Lang = val!;
                  });
                }),
            RadioListTile(
                value: "Hindi",
                title: const Text("Hindi"),
                groupValue: Lang,
                onChanged: (val) {
                  setState(() {
                    Lang = val!;
                  });
                }),
            RadioListTile(
                value: "English",
                title: const Text("English"),
                groupValue: Lang,
                onChanged: (val) {
                  setState(() {
                    Lang = val!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
