/*import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:highlight/highlight.dart';
import 'package:highlight/languages/cpp.dart';

class BtmAdmin extends StatefulWidget {
  const BtmAdmin({Key? key});

  @override
  State<BtmAdmin> createState() => _BtmAdminState();
}

class _BtmAdminState extends State<BtmAdmin> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _outputController = TextEditingController();
  List<String> typecode = ['Select Type', 'Basic', 'Intermediate', 'Advanced'];
  String? selectedtypecode = "Select Type";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>(); // Added form key

  bool _isUploading = false;
  double _uploadProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Post Your Code Here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade800, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade800,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedtypecode,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedtypecode = newValue!;
                            });
                          },
                          items: typecode.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CodeField(
                    controller: CodeController(
                      text: _codeController.text,
                      language: Mode(subLanguage: ['c']),
                    ),
                    textStyle:
                        TextStyle(fontFamily: 'SourceCode', fontSize: 20),
                    onChanged: (code) {
                      _codeController.text = code;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _outputController,
                    decoration: InputDecoration(
                      labelText: 'Output',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade800, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  if (_isUploading)
                    LinearProgressIndicator(
                      value: _uploadProgress,
                      minHeight: 10,
                    ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_codeController.text != '' &&
                          selectedtypecode != 'Selected Type') {
                        _saveToFirebase(selectedtypecode.toString());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Enter the All Details')));
                      }
                    },
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800, elevation: 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to save data to Firebase
  void _saveToFirebase(String filename) async {
    try {
      // Validate the form
      if (_formKey.currentState?.validate() ?? false) {
        // Start uploading
        setState(() {
          _isUploading = true;
        });

        // Show progress dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Uploading...'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                    value: _uploadProgress,
                    minHeight: 10,
                  ),
                  SizedBox(height: 10),
                  Text('${(_uploadProgress * 100).toStringAsFixed(2)}%'),
                ],
              ),
            );
          },
        );

        // Get the data from controllers
        String title = _titleController.text;
        String code = _codeController.text;
        String output = _outputController.text;

        // Perform the upload
        await _firestore.collection('$filename').add({
          'title': title,
          'code': code,
          'output': output,
          'timestamp': FieldValue.serverTimestamp(),
        }).then((_) {
          // Close the progress dialog
          Navigator.of(context).pop();

          setState(() {
            _isUploading = false;
            _uploadProgress = 0.0;
          });

          _titleController.clear();
          _codeController.clear();
          _outputController.clear();
          setState(() {
            selectedtypecode = "Select Type";
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Post successful!'),
              duration: Duration(seconds: 2),
            ),
          );
        }).catchError((error) {
          print('Error posting data: $error');

          // Close the progress dialog
          Navigator.of(context).pop();

          setState(() {
            _isUploading = false;
            _uploadProgress = 0.0;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error posting data: $error'),
              duration: Duration(seconds: 2),
            ),
          );
        });
      }
    } catch (e) {
      print('Error posting data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error posting data: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}*/
