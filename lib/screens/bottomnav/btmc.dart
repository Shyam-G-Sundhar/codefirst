import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtmC extends StatefulWidget {
  const BtmC({super.key});

  @override
  State<BtmC> createState() => _BtmCState();
}

class _BtmCState extends State<BtmC> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'About C Programming',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'C is a general-purpose, procedural programming language created by Dennis Ritchie at Bell Labs in the early 1970s. It was developed as an evolution of the B programming language and played a crucial role in the development of the Unix operating system. C is known for its efficiency, low-level programming capabilities, and a straightforward syntax',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Key Feautures of C",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2.0,
                            decorationColor: Colors.blue.shade900,
                            fontSize: 20,
                            color: Colors.blue.shade800),
                      ),
                    ],
                  ),
                ),
                CTile(
                  title: 'Procedural Language',
                  para:
                      'C follows a procedural programming paradigm, emphasizing procedures or routines that perform specific tasks.',
                ),
                CTile(
                  title: 'Low-Level Programming',
                  para:
                      'C provides low-level access to memory through pointers, enabling developers to manipulate memory directly. This feature is powerful but requires careful handling to avoid errors.',
                ),
                CTile(
                  title: 'Efficiency',
                  para:
                      'C is designed for efficiency and is often used for system-level programming, embedded systems, and performance-critical applications. Its ability to directly interact with hardware and memory contributes to its efficiency.',
                ),
                CTile(
                    title: 'Portability',
                    para:
                        'C programs can be compiled on different platforms with minimal or no modifications, making it a portable language. However, platform-specific features may require adjustments when moving code between different systems.'),
                CTile(
                  title: 'Structured Programming',
                  para:
                      'C supports structured programming with features like functions and control structures (if-else statements, loops). This helps in organizing code and improving readability.',
                ),
                CTile(
                    title: 'Rich Standard Library',
                    para:
                        'C comes with a standard library that includes a wide range of functions for tasks such as input/output, string manipulation, memory allocation, and mathematical operations.'),
                CTile(
                    title: 'Pointer Arithmetic',
                    para:
                        'C allows manipulation of memory addresses through pointers, offering fine-grained control over data structures and efficient memory management.'),
                CTile(
                    title: 'Static Typing',
                    para:
                        'C is statically typed, meaning variable types must be declared before compilation. This helps catch errors at compile-time.'),
                CTile(
                  title: 'Extensibility',
                  para:
                      'C supports the creation of libraries, allowing developers to extend functionality and share code through reusable modules.',
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Common Use Cases",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2.0,
                            decorationColor: Colors.blue.shade900,
                            fontSize: 20,
                            color: Colors.blue.shade800),
                      ),
                    ],
                  ),
                ),
                CTile(
                    title: 'Operating Systems',
                    para:
                        'Many operating systems, including Unix, Linux, and portions of Windows, are written in C.'),
                CTile(
                    title: 'Embedded Systems',
                    para:
                        'C is widely used for programming embedded systems and firmware due to its low-level capabilities and efficiency.'),
                CTile(
                    title: 'Game Development',
                    para:
                        'Parts of game engines and performance-critical sections of games are often written in C.'),
                CTile(
                    title: 'System Software',
                    para:
                        'System utilities, compilers, and interpreters are commonly implemented in C.'),
                CTile(
                    title: 'Network Programming',
                    para:
                        'C is used for developing networking software and protocols.'),
                CTile(
                    title: 'Device Drivers',
                    para:
                        'Writing device drivers for hardware components often involves C programming.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CTile extends StatefulWidget {
  const CTile({
    super.key,
    required this.title,
    required this.para,
  });
  final String title, para;
  @override
  State<CTile> createState() => _CTileState();
}

class _CTileState extends State<CTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(5.0),
        collapsedBackgroundColor: Colors.grey.shade300,
        title: Text(
          "${widget.title}",
          style: TextStyle(
              color: Colors.blue.shade800,
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
        childrenPadding: EdgeInsets.all(7.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.para}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
