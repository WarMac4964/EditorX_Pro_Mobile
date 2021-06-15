import 'dart:io';
import 'package:editorx_pro/provider/edited.dart';
import 'package:editorx_pro/screens/about_screen.dart';
import 'package:editorx_pro/screens/editing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  Future<void> _camera() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _picture = File(pickedImage.path);
      });

      Provider.of<Edited>(context, listen: false).update(_picture);

      Navigator.of(context).pushNamed(EditingScreen.routeName);
    }
  }

  Widget build(BuildContext context) {
    final Color bgColor = Provider.of<ColorMode>(context).bgColor;
    final Color textColor = Provider.of<ColorMode>(context).textColor;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        actions: <Widget>[
          Container(
              child: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: textColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AboutScreen.routeName);
                  }))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: Image.asset('assets/logo.png')),
            GestureDetector(
              onTap: () async {
                await _camera();
              },
              child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: textColor),
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.file_copy, size: 30, color: textColor),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Choose from gallery',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () async {
                await _takePicture();
              },
              child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: textColor),
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.camera, size: 30, color: textColor),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Choose from gallery',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
