import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'generated/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile ui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          primaryColor: Colors.pink.shade400,
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          dividerTheme: DividerThemeData(color: Colors.white),
          scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
          textTheme: GoogleFonts.latoTextTheme(TextTheme(
              bodyText2: TextStyle(fontSize: 15),
              bodyText1: TextStyle(
                  fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
              headline6: TextStyle(fontWeight: FontWeight.bold),
              subtitle1:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16)))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile sample"),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(CupertinoIcons.chat_bubble_text),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Assets.imagesMrm,
                      width: 80,
                      height: 80,
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mojtaba Eshaghi",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text("SoftWare developer"),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            size: 16,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Norway/Oslo",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
              ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
              ' Ut enim ad minim veniam, quis nostrud exercitation ullamco '
              'laboris nisi ut aliquip ex ea commodo consequat.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Skills",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 2,
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                )
              ],
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(),
              child: Column(
                children: [
Image.asset(Assets.imagesAppIcon01),
                  Text('Photoshop')
                ],
              ),
            )],
          )
        ],
      ),
    );
  }
}
