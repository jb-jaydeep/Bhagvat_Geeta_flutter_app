import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Model/JsonData.dart';
import 'Provider/ThemeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bhagavat Geeta"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).Themechanger();
            },
            icon: Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) {
                return themeProvider.isdark
                    ? const Icon(Icons.mode_night)
                    : const Icon(Icons.light_mode_rounded);
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("jsonData/data.json"),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            String data = snapshot.data!;
            Map decodedData = jsonDecode(data);
            List myData = decodedData["Data"];

            List<JsonData> PostData =
                myData.map((e) => JsonData.formMap(Data: e)).toList();
            return GridView.builder(
                itemCount: PostData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("DetailPage", arguments: PostData[i]);
                      },
                      child: SizedBox(
                        height: h * 0.2,
                        width: w,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    PostData[i].image_name,
                                  ),
                                ),
                              ),
                              height: h * 0.4,
                              width: w,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: h * 0.05,
                              width: w,
                              child: Text("${PostData[i].id}"
                                  "-"
                                  "${PostData[i].GujName}"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
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
