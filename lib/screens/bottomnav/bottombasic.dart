import 'package:codefirst/screens/bottomnav/btmabt.dart';
import 'package:codefirst/screens/bottomnav/btmadmin.dart';
import 'package:codefirst/screens/bottomnav/btmadv.dart';
import 'package:codefirst/screens/bottomnav/btmbasic.dart';
import 'package:codefirst/screens/bottomnav/btminter.dart';
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
            'C Program Editor',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2.0,
          backgroundColor: Colors.blue.shade800,
          selectedItemColor: Colors.blue.shade800,
          unselectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 0
                    ? Icon(Icons.school, key: ValueKey<int>(0))
                    : Icon(Icons.school_outlined, key: ValueKey<int>(1)),
              ),
              label: 'Basic',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 1
                    ? Icon(Icons.local_library, key: ValueKey<int>(2))
                    : Icon(Icons.local_library_outlined, key: ValueKey<int>(3)),
              ),
              label: 'Intermediate',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 2
                    ? Icon(Icons.star, key: ValueKey<int>(4))
                    : Icon(Icons.star_border, key: ValueKey<int>(5)),
              ),
              label: 'Advanced',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _currentIndex == 3
                    ? Icon(Icons.info, key: ValueKey<int>(6))
                    : Icon(Icons.info_outline, key: ValueKey<int>(7)),
              ),
              label: 'About',
            ),
          ],
        ),
      ),
    );
  }
}

final List<Widget> _pages = [BtmBasic(), BtmInter(), BtmAdv(), BtmAbt()];

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
