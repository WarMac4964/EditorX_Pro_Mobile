import 'package:editorx_pro/provider/edited.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Color bgColor = Provider.of<ColorMode>(context).bgColor;
    final Color textColor = Provider.of<ColorMode>(context).textColor;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
      ),
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                width: size.width / 2,
                child: Image.asset('assets/logo_bg.png'),
              ),
              Text(
                'Anurag Tyagi',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontFamily: 'Reality Hyper'),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Color Mode',
                      style: TextStyle(color: textColor),
                    ),
                    SwitchWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = true;

  void toggleSwitch(value) {
    Provider.of<ColorMode>(context, listen: false).update();

    if (isSwitched) {
      setState(() {
        isSwitched = false;
      });
    } else {
      setState(() {
        isSwitched = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: toggleSwitch,
      inactiveThumbImage: AssetImage('assets/sun.png'),
      inactiveTrackColor: Colors.yellow,
      activeTrackColor: Colors.blue,
      activeThumbImage: AssetImage('assets/moon.png'),
    );
  }
}
