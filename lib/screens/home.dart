import 'package:codefirst/screens/bottomnav/bottombasic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
            elevation: 10,
            toolbarHeight: 180.h,
            centerTitle: true,
            title: Text(
              'CodePlay Connect',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/home.png', width: 300, height: 300),
                  SizedBox(
                    height: 25.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: BottomBasic(),
                              type: PageTransitionType.leftToRight,
                              duration: Duration(microseconds: 400)),
                          (route) => false);
                    },
                    child: Text(
                      "Let's Learn C Programming",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                    ),
                  ),
                  SizedBox(
                    height: 75.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.h),
                    child: Text(
                      "Errors are the stepping stones to expertise don't fear them, but learn from them",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.2.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
