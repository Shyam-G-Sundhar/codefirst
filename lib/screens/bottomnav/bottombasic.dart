import 'package:codefirst/screens/bottomnav/Modules/Strunion.dart';
import 'package:codefirst/screens/bottomnav/Modules/array.dart';
import 'package:codefirst/screens/bottomnav/Modules/controlstr.dart';
import 'package:codefirst/screens/bottomnav/Modules/files.dart';
import 'package:codefirst/screens/bottomnav/Modules/functions.dart';
import 'package:codefirst/screens/bottomnav/Modules/memalloc.dart';
import 'package:codefirst/screens/bottomnav/Modules/pointer.dart';
import 'package:codefirst/screens/bottomnav/btmabt.dart';
import 'package:codefirst/screens/bottomnav/btmbasic.dart';
import 'package:codefirst/screens/bottomnav/btmc.dart';
import 'package:codefirst/screens/bottomnav/btmlab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBasic extends StatefulWidget {
  const BottomBasic({super.key});

  @override
  State<BottomBasic> createState() => _BottomBasicState();
}

class _BottomBasicState extends State<BottomBasic> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
            elevation: 10,
            centerTitle: true,
            title: Text(
              'CodePlay Connect',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white)),
        drawer: Drawer(
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                ),
                child: Text(
                  'CodePlay Connect',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.code_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'About C Programming',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.school_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Basic',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_tree_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Control Structures',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.data_array,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Arrays',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.functions_rounded,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Functions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(4);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.join_inner_rounded,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Structures & Unions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(5);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.location_searching,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Pointers',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(6);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.folder_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Files',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(7);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.memory_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Memory Allocations',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(8);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.corporate_fare_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'Interview Questions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(9);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  size: 25,
                  color: Colors.black,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _onNavItemTapped(10);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  void _onNavItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

final List<Widget> _pages = [
  BtmC(),
  BtmBasic(),
  BtmControlStructures(),
  BtmArray(),
  BtmFunctions(),
  BtmStrUnion(),
  BtmPointer(),
  BtmFiles(),
  BtmMemAlloc(),
  BtmLab(),
  BtmAbt(),
];

class PlaceholderPage extends StatelessWidget {
  final String title;

  PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
