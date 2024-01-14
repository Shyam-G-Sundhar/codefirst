import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefirst/screens/programscreen/progscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class BtmFiles extends StatefulWidget {
  const BtmFiles({Key? key});

  @override
  State<BtmFiles> createState() => _BtmFilesState();
}

class _BtmFilesState extends State<BtmFiles> {
  late TextEditingController _searchController;
  late List<DocumentSnapshot> _documents;
  late List<DocumentSnapshot> _filteredDocuments;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _documents = [];
    _filteredDocuments = [];
    _loadDocuments();
  }

  void _loadDocuments() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Files').get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    documents.sort((a, b) => a['title']
        .toString()
        .toLowerCase()
        .compareTo(b['title'].toString().toLowerCase()));

    setState(() {
      _documents = documents;
      _filteredDocuments = _documents;
    });
  }

  void _filterData(String value) {
    setState(() {
      _filteredDocuments = _documents
          .where((doc) =>
              doc['title']
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              doc['code']
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              doc['output']
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()))
          .toList();
    });
  }

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
                    'Files Codes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              _documents.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) {
                          _filterData(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    )
                  : Text(
                      'No Data',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
              _documents.isNotEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          child: Column(
                            children: _filteredDocuments.isNotEmpty
                                ? _filteredDocuments.map((doc) {
                                    return ProgramName(
                                      name: doc['title'] ?? "",
                                      program: doc['code'] ?? "",
                                      output: doc['output'] ?? "",
                                      size: 20,
                                    );
                                  }).toList()
                                : [
                                    Center(
                                      child: Text(
                                        'No matching documents found.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                      ),
                    )
                  : Text(""),

              /*SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    // height: 450.h,
                    child: SingleChildScrollView(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Intermediate')
                            .snapshots(),
                        builder: (context, snapshot) {
                          var documents = snapshot.data?.docs;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (documents!.isEmpty) {
                            return Center(
                              child: Text(
                                'No Data',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Use the data from the snapshot
                            var documents = snapshot.data?.docs;
                            return Column(
                              children: documents!.map((doc) {
                                return ProgramName(
                                  name: doc['title'] ?? '',
                                  program: doc['code'] ?? '',
                                  output: doc['output'] ?? "",
                                  size: 20,
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProgramName extends StatefulWidget {
  ProgramName(
      {Key? key, required this.name, this.program, this.size, this.output});
  final name, program, output;
  double? size;

  @override
  State<ProgramName> createState() => _ProgramNameState();
}

class _ProgramNameState extends State<ProgramName> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            PageTransition(
              child: ProgScreen(
                progname: widget.name,
                code: widget.program,
                output: widget.output,
              ),
              type: PageTransitionType.leftToRight,
              duration: Duration(microseconds: 300),
            ),
            (route) => true,
          );
        },
        child: Container(
          height: 65.h,
          width: MediaQuery.of(context).size.width.w,
          decoration: BoxDecoration(
            color: Colors.blue.shade800,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      '${widget.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.size,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                          code: widget.program,
                          output: widget.output,
                        ),
                        type: PageTransitionType.leftToRight,
                        duration: Duration(microseconds: 300),
                      ),
                      (route) => true,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
