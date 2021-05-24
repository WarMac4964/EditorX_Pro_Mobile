import 'dart:io';
import 'package:editorx_pro/provider/edited.dart';
import 'package:editorx_pro/screens/editing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File _picture;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _takePicture() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _picture = File(pickedImage.path);
      });
      Provider.of<Edited>(context, listen: false).update(_picture);
      Navigator.of(context).pushNamed(EditingScreen.routeName);
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'EditorX',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Container(
              child: IconButton(
            icon: Icon(
              Icons.add_a_photo_outlined,
              color: Colors.black,
            ),
            onPressed: () async {
              await _takePicture();
            },
          ))
        ],
      ),
      body: GestureDetector(
        onTap: () async {
          await _takePicture();
        },
        child: Container(
          color: Colors.white,
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/imp_ill.svg',
                width: size.width * 0.8,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Tap anywhere to select a photo to edit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
