import 'package:editorx_pro/provider/theme_mode.dart' as theme;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool mode = true;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<theme.Thememode>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: state.primaryColor,
      width: size.width,
      height: size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'editorX',
                    style: TextStyle(
                      color: Color.fromRGBO(209, 44, 44, 1),
                      fontSize: 24,
                      fontFamily: 'Reality Hyper',
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    'File',
                    style: TextStyle(
                      color: state.textColor,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    'Resize',
                    style: TextStyle(
                      color: state.textColor,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.save,
                      color: state.textColor,
                    ),
                    Text(
                      "Export",
                      style: TextStyle(
                        color: state.textColor,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                onTap: () {},
              ),
              Switch(
                value: mode,
                activeColor: Colors.amber,
                activeThumbImage: AssetImage('assets/sun.png'),
                inactiveThumbImage: AssetImage('assets/moon.png'),
                inactiveThumbColor: Colors.blue,
                inactiveTrackColor: Colors.blue,
                onChanged: (value) {
                  mode = !mode;
                  state.toggleMode();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
