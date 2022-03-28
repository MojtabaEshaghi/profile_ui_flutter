import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'generated/assets.dart';

void main() {
  runApp(const MyApp());
}

enum _SkillType { photoshop, xd, illustrator, afterEffect, lightRoom }

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
          dividerColor: const Color(0x0dffffff),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile sample"),
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
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle1,
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
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .color,
                            size: 16,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Norway/Oslo",
                            style: Theme
                                .of(context)
                                .textTheme
                                .caption,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme
                      .of(context)
                      .primaryColor,
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
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                )
              ],
            ),
          ),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: [
                SkillItem(
                    title: 'photoshop',
                    imagePath: Assets.imagesAppIcon01,
                    isActive: true,
                    shadowColor: Colors.blue.shade300),
                SkillItem(
                    title: 'Lightroom',
                    imagePath: Assets.imagesAppIcon02,
                    isActive: false,
                    shadowColor: Colors.blue.shade600),
                SkillItem(
                    title: 'AfterEffect',
                    imagePath: Assets.imagesAppIcon03,
                    isActive: false,
                    shadowColor: Colors.deepPurpleAccent.shade400),
                SkillItem(
                    title: 'Illustrator',
                    imagePath: Assets.imagesAppIcon04,
                    isActive: false,
                    shadowColor: Colors.orange.shade600),
                SkillItem(
                    title: 'XD',
                    imagePath: Assets.imagesAppIcon05,
                    isActive: false,
                    shadowColor: Colors.purpleAccent.shade400),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final String title, imagePath;
  final bool isActive;
  final Color shadowColor;
  final Function onTap;
  final _SkillType skillType;

  const SkillItem({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.isActive,
    required this.shadowColor,
    required this.onTap,
    required this.skillType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
            color: Theme
                .of(context)
                .dividerColor,
            borderRadius: BorderRadius.circular(16))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
