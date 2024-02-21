import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_app/Data/AppAssets.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Screens/Components/CommonButton.dart';
import 'package:task_app/Screens/Profile/components/Listtile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? selectedimage;
  String? myEmail;

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    }
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await addUserDocument(firebaseUser.uid, firebaseUser.email!);
    }
    setState(() {
      selectedimage = File(pickedImage.path);
    });
  }

  Future<String?> _fetch() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        DocumentSnapshot<Map<String, dynamic>> ds = await FirebaseFirestore
            .instance
            .collection('user')
            .doc(firebaseUser.uid)
            .get();

        if (ds.exists) {
          if (ds.data() != null && ds.data()!.containsKey('email')) {
            String email = ds.data()!['email'];
            return email;
          } else {
            print('Email field not found in the document data.');
          }
        } else {
          print('Document does not exist.');
        }
      } else {
        print('Firebase user is null.');
      }
    } catch (e) {
      print('Error fetching user email: $e');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kthemelight,
        body: SafeArea(
            child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(AppAssets.login),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextButton(
                          child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: AppColors.kthemedark,
                              ),
                              child: Center(
                                  child: Text(
                                'Upload Image',
                                style: AppTypography.kSemiBold12
                                    .copyWith(color: AppColors.kBlack),
                              ))),
                          onPressed: () {
                            _pickImageFromGallery();
                          },
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                        FutureBuilder<String?>(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done)
                              return Text("Loading data...Please wait");

                            if (snapshot.hasError) {
                              return const Text(
                                "Error loading data",
                              );
                            }

                            return ListTile(
                              leading: Icon(
                                Icons.email,
                                color: AppColors.kthemedark,
                              ),
                              title: Text(
                                'Email',
                                style: AppTypography.kSemiBold16,
                              ),
                              //    trailing: Text("${snapshot.data ?? 'N/A'}"));
                            );
                          },
                        ),
                        const ListTileCard(
                          icon: Icons.settings,
                          text: 'Settings',
                        ),
                        const ListTileCard(
                          icon: Icons.privacy_tip,
                          text: 'Privacy',
                        )
                      ]),
                ))));
  }
}

Future<void> addUserDocument(String uid, String email) async {
  try {
    await FirebaseFirestore.instance.collection('user').doc(uid).set({
      'email': email,
      // add other fields as needed
    });
    print('User document added successfully.');
  } catch (e) {
    print('Error adding user document: $e');
  }
}
