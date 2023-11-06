import 'package:codefirst/screens/programscreen/progscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class BtmInter extends StatefulWidget {
  const BtmInter({super.key});

  @override
  State<BtmInter> createState() => _BtmInterState();
}

class _BtmInterState extends State<BtmInter> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Center(
                  child: Text(
                    'Intermediate Codes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 450.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProgramName(
                      name: 'For Loop',
                      size: 25,
                    ),
                    ProgramName(
                      name: 'While Loop',
                      size: 25,
                    ),
                    ProgramName(
                      name: 'Do-While Loop',
                      size: 25,
                    ),
                    ProgramName(
                      name: 'Find Factorial',
                      size: 22,
                    ),
                    ProgramName(
                      name: 'Fibbonacci Series',
                      size: 25,
                    ),
                    ProgramName(
                      name: 'Palindrome',
                      size: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgramName extends StatefulWidget {
  ProgramName({super.key, required this.name, this.program, this.size});
  final name, program;
  double? size;
  @override
  State<ProgramName> createState() => _ProgramNameState();
}

class _ProgramNameState extends State<ProgramName> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 65.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
            color: Colors.blue.shade800,
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.name}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.size,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  splashColor: Colors.white,
                  hoverColor: Colors.white,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageTransition(
                            child: ProgScreen(
                              progname: widget.name,
                            ),
                            type: PageTransitionType.leftToRight,
                            duration: Duration(microseconds: 300)),
                        (route) => true);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 35,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
