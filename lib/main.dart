import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'generated/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig(
      {required this.brightness,
      required this.primaryTextColor,
      required this.secondaryTextColor,
      required this.surfaceColor,
      required this.backgroundColor,
      required this.appBarColor});

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        backgroundColor = const Color.fromARGB(200, 255, 255, 255),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = const Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.dark;

  ThemeData getTheme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        brightness: brightness,
        primaryColor: primaryColor,
        dividerColor: const Color(0x0dffffff),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: surfaceColor),
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        dividerTheme: DividerThemeData(color: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink.shade400)),
        ),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
            bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
            bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
            headline6:
                TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
            subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))));
  }
}

enum _SkillType { photoshop, xd, illustrator, afterEffect, lightRoom }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile ui',
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
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
  _SkillType _skillSelected = _SkillType.photoshop;

  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skillSelected = skillType;
    });
  }

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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
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
                    isActive: _skillSelected == _SkillType.photoshop,
                    shadowColor: Colors.blue.shade300,
                    skillType: _SkillType.photoshop,
                    onTap: () {
                      updateSelectedSkill(_SkillType.photoshop);
                    },
                  ),
                  SkillItem(
                    title: 'Lightroom',
                    imagePath: Assets.imagesAppIcon02,
                    isActive: _skillSelected == _SkillType.lightRoom,
                    shadowColor: Colors.blue.shade600,
                    skillType: _SkillType.lightRoom,
                    onTap: () {
                      updateSelectedSkill(_SkillType.lightRoom);
                    },
                  ),
                  SkillItem(
                    title: 'AfterEffect',
                    imagePath: Assets.imagesAppIcon03,
                    isActive: _skillSelected == _SkillType.afterEffect,
                    shadowColor: Colors.deepPurpleAccent.shade400,
                    skillType: _SkillType.afterEffect,
                    onTap: () {
                      updateSelectedSkill(_SkillType.afterEffect);
                    },
                  ),
                  SkillItem(
                    title: 'Illustrator',
                    imagePath: Assets.imagesAppIcon04,
                    isActive: _skillSelected == _SkillType.illustrator,
                    shadowColor: Colors.orange.shade600,
                    skillType: _SkillType.illustrator,
                    onTap: () {
                      updateSelectedSkill(_SkillType.illustrator);
                    },
                  ),
                  SkillItem(
                    title: 'XD',
                    imagePath: Assets.imagesAppIcon05,
                    isActive: _skillSelected == _SkillType.xd,
                    shadowColor: Colors.purpleAccent.shade400,
                    skillType: _SkillType.xd,
                    onTap: () {
                      updateSelectedSkill(_SkillType.xd);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Personal Information",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(CupertinoIcons.at)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(CupertinoIcons.lock)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Save")))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final String title, imagePath;
  final bool isActive;
  final Color shadowColor;
  final VoidCallback onTap;
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
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 50,
                height: 50,
              ),
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
