import 'package:editorx_pro/provider/edited.dart';
import 'package:editorx_pro/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:provider/provider.dart';

class EditingScreen extends StatefulWidget {
  static const routeName = '/editing';

  static List<Filter> filters = presetFiltersList;

  @override
  _EditingScreenState createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  File picture;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Color bgColor = Provider.of<ColorMode>(context).bgColor;
    final Color textColor = Provider.of<ColorMode>(context).textColor;
    return Scaffold(
        backgroundColor: bgColor,
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          title: Text(
            'Edit Image',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: textColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: bgColor,
          child: InteractiveViewer(
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  width: size.width * 0.9,
                  height: size.height / 1.5,
                  alignment: Alignment.center,
                  child: Image.file(
                    Provider.of<Edited>(context).image,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  )),
            ),
          ),
        ));
  }
}
