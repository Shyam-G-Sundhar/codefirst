import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgScreen extends StatefulWidget {
  ProgScreen({Key? key, required this.progname, this.code, this.output})
      : super(key: key);

  final progname, code, output;

  @override
  State<ProgScreen> createState() => _ProgScreenState();
}

class _ProgScreenState extends State<ProgScreen> {
  bool isShow = false;
  double fontSize = 15;

  @override
  Widget build(BuildContext context) {
    final source = """
${widget.code}
""";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue.shade800,
          title: Text(
            '${widget.progname}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Program',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black87,
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HighlightView(
                            source,
                            language: 'c',
                            theme: monokaiSublimeTheme,
                            padding: EdgeInsets.all(12),
                            textStyle: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Monospace',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        fontSize += 2;
                      });
                    },
                    child: Icon(Icons.zoom_in),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (fontSize > 2) {
                          fontSize -= 2;
                        }
                      });
                    },
                    child: Icon(Icons.zoom_out),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: source),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Code copied to clipboard'),
                        ),
                      );
                    },
                    child: Icon(Icons.copy),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  child: Text(
                    'Output',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              if (isShow == true)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Text(
                    '${widget.output}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
