import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BtmAdmin extends StatefulWidget {
  const BtmAdmin({Key? key}) : super(key: key);

  @override
  State<BtmAdmin> createState() => _BtmAdminState();
}

class _BtmAdminState extends State<BtmAdmin> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController outputController = TextEditingController();
  late String documentUrl;

  Future<void> _uploadDocument() async {
    String filePath = '/path/to/your/document.txt';
    Reference storageReference =
        FirebaseStorage.instance.ref().child('documents/document.txt');
    UploadTask uploadTask =
        storageReference.putFile(Uri.file(filePath) as File);

    await uploadTask.whenComplete(() async {
      documentUrl = await storageReference.getDownloadURL();
      print('Document uploaded to: $documentUrl');
    });
  }

  Future<void> _saveToFirebase() async {
    try {
      await FirebaseFirestore.instance.collection('adminData').add({
        'title': titleController.text,
        'documentUrl': documentUrl,
        'output': outputController.text,
      });
      print('Data saved to Firestore');
    } catch (e) {
      print('Error saving data to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _uploadDocument,
                child: Text('Upload Document'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: outputController,
                decoration: InputDecoration(labelText: 'Output'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await _saveToFirebase();
                },
                child: Text('Save to Firebase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
