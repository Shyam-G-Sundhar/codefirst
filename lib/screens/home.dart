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
            toolbarHeight: 200.h,
            centerTitle: true,
            title: Text(
              'C Program Editor',
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
                  Image.network(
                      'https://ouch-cdn2.icons8.com/Lhq5dBICYdkNoSP3WpZRnUAHYVYxyt8GQ-vnM6bmjS4/rs:fit:368:237/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTM5/L2EwYjFiZjkyLTFm/MDgtNDNmYi1hZmI4/LTQzZjFlMjFlYWMw/Mi5wbmc.png',
                      width: 300,
                      height: 300),
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
                          fontSize: 25),
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
                      "Errors are the stepping stones to expertise;don't fear them, but learn from them",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.2.sp,
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
