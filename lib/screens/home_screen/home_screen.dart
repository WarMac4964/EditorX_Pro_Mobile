import 'package:editorx_pro/widget/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:editorx_pro/provider/theme_mode.dart' as theme;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<theme.Thememode>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: state.primaryColor,
        ),
        child: Column(
          children: <Widget>[
            NavBar(),
            Row(
              children: <Widget>[
                Container(
                  color: state.primaryColor,
                  height: size.height * 0.83,
                  width: size.width * 0.05,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.filter,
                          color: state.textColor,
                        ),
                        onPressed: () {},
                        iconSize: 25,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.exposure,
                          color: state.textColor,
                        ),
                        onPressed: () {},
                        iconSize: 25,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.colorize,
                          color: state.textColor,
                        ),
                        onPressed: () {},
                        iconSize: 25,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.text_fields,
                          color: state.textColor,
                        ),
                        onPressed: () {},
                        iconSize: 25,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: state.textColor,
                          ),
                          onPressed: () {},
                          iconSize: 25,
                          highlightColor: Colors.blue),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: state.secondaryColor,
                  ),
                  margin: EdgeInsets.only(right: size.width * 0.01),
                  width: size.width * 0.94,
                  height: size.height * 0.83,
                  child: Container(
                    padding: EdgeInsets.all(20),
                  ),
                )
              ],
            ),
            Container(
                width: size.width,
                height: size.height * 0.07,
                color: state.primaryColor,
                child: Row(
                  children: <Widget>[],
                ))
          ],
        ),
      ),
    );
  }
}
