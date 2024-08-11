import 'package:flutter/material.dart';
import 'package:dot_bottom_nav_bar/view/dot_bottom_nav_bar.dart';
import 'package:resqaid/community/community.dart';
import 'package:resqaid/education/education.dart';
import 'package:resqaid/home/home.dart';
import 'package:resqaid/medkit/medkit.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Navbar extends StatefulWidget {
  static const String routeName = "/nav-bar";
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectIndex = 0;

  List<Widget> _modules = const [
    Home(),
    Community(),
    Education(),
    Medkit(),
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: _modules[selectIndex],
      bottomNavigationBar: DotBottomNavBar(
        // backgroundColor: Colors.transparent,
        selectedColor: appColors.primary,
        dotColor: appColors.primary,
        currentIndex: selectIndex,
        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },
        items: [
          BottomNavItem(
            emptySvg: "assets/icons/outline/home.svg",
            fillSvg: "assets/icons/fill/home.svg",
            label: "Home",
          ),
          BottomNavItem(
            emptySvg: "assets/icons/outline/community.svg",
            fillSvg: "assets/icons/fill/community.svg",
            label: "AID Request",
          ),
          BottomNavItem(
            emptySvg: "assets/icons/outline/education.svg",
            fillSvg: "assets/icons/fill/education.svg",
            label: "Guidence",
          ),
          BottomNavItem(
            emptySvg: "assets/icons/outline/medkit.svg",
            fillSvg: "assets/icons/fill/medkit.svg",
            label: "Self-Care",
          ),
        ],
      ),
    );
  }
}
