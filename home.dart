import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  ImagePicker image = ImagePicker();
  File? profile_image = null;
  String? base64image;

  Future adduser(String name, String email, String phone, String photo) async {
    var url = "http://192.168.0.121/final_project/add_users.php";
    Response x = await post(
      Uri.parse(url),
      body: {'name': name, 'email': email, 'phone': phone, 'image': photo},
    );
    if (x.statusCode == 200) {
      print("\n=====================${x.body}===================\n");
      return await x.body;
    } else {
      print("\n=====================${x.body}===================\n");
      return await x.statusCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.green.shade100,

        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "تكاليف الفلاتر",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.green.shade600,
          leading: IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setDialogState) {
                      return AlertDialog(
                        title: Row(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text("البيانات الشخصية"),
                          ],
                        ),
                        content: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 70.0,
                                      backgroundColor: Colors.green.shade50,
                                      backgroundImage: base64image != null
                                          ? MemoryImage(
                                        base64Decode(base64image!),
                                      )
                                          : null,
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: GestureDetector(
                                        onTap: () async {
                                          final XFile? img = await image
                                              .pickImage(
                                            source: ImageSource.camera,
                                          );
                                          if (img != null) {
                                            List<int> byte = await img
                                                .readAsBytes();
                                            setDialogState(() {
                                              base64image = base64Encode(byte);
                                              print("${base64image}");
                                            });
                                            setState(() {
                                              base64image = base64Encode(byte);
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(color: Colors.black, thickness: 1.0),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: fullname,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    labelText: "الاسم الكامل",
                                  ),
                                ),
                                SizedBox(height: 5),
                                Divider(color: Colors.black, thickness: 1.0),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: email,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    labelText: "البريد الإلكتروني",
                                  ),
                                ),
                                SizedBox(height: 5),
                                Divider(color: Colors.black, thickness: 1.0),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: phonenumber,
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    labelText: "رقم الهاتف",
                                  ),
                                ),
                                SizedBox(height: 5),
                                Divider(color: Colors.black, thickness: 1.0),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        setState(() {});
                                        adduser(
                                          fullname.text,
                                          email.text,
                                          phonenumber.text,
                                          base64image!,
                                        );
                                        fullname.text = '';
                                        email.text = '';
                                        phonenumber.text = '';
                                        base64image = '';

                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.send,
                                        color: Colors.green.shade600,
                                      ),
                                    ),
                                    SizedBox(width: 150),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        fullname.text = '';
                                        email.text = '';
                                        phonenumber.text = '';
                                        base64image = '';
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.red.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            icon: Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.menu, color: Colors.white, size: 30),
            ),
          ],
        ),
        body: Column(),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.green.shade50,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.green.shade600,
            iconSize: 30.0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "الرئيسية"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "الإعدادت"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: "المفضلة",),
            ]),
      ),
    );
  }
}
