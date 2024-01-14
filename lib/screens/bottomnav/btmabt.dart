import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtmAbt extends StatefulWidget {
  const BtmAbt({super.key});

  @override
  State<BtmAbt> createState() => _BtmAbtState();
}

class _BtmAbtState extends State<BtmAbt> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 55.h, horizontal: 25.h),
            child: Column(
              children: [
                Image.asset(
                  'assets/info.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'About',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 35.sp,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  'Thanks For Using For Our App',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Shyam Sundhar G\nCSE (AIML)',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Prof. Pandiyarajan G\nAssistant Professor (Sl .G.)',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'CSE(AIML)',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
