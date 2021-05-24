//Dart Imports
import 'dart:io';

//Flutter Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//Additional Imports
import 'package:editorx_pro/provider/edited.dart';
import 'package:editorx_pro/screens/editing_screen.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_save/image_save.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;
import 'package:photofilters/photofilters.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final File picture = Provider.of<Edited>(context).image;
    var image = imageLib.decodeImage(picture.readAsBytesSync());
    String fileName = basename(picture.path);
    void effects() async {
      Map pictureFilter = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => new PhotoFilterSelector(
            title: Text("Photo Filter Example"),
            image: image,
            filters: EditingScreen.filters,
            filename: fileName,
            loader: Center(child: CircularProgressIndicator()),
            fit: BoxFit.contain,
          ),
        ),
      );
      Provider.of<Edited>(context, listen: false)
          .update(pictureFilter['image_filtered']);
    }

    AndroidUiSettings androidUiSettingsLocked() => AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          lockAspectRatio: false,
          initAspectRatio: CropAspectRatioPreset.original,
        );
    IOSUiSettings iosUiSettingsLocked() => IOSUiSettings(
          rotateButtonsHidden: false,
          rotateClockwiseButtonHidden: false,
          aspectRatioLockEnabled: false,
          aspectRatioPickerButtonHidden: false,
        );
    Future<File> cropImg(File imageFile) async => await ImageCropper.cropImage(
          sourcePath: imageFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio16x9,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.square
          ],
          androidUiSettings: androidUiSettingsLocked(),
          iosUiSettings: iosUiSettingsLocked(),
        );

    _showMaterialDialog(String text) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: new Text("Export"),
                content: new Text(text),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  )
                ],
              ));
    }

    _showCupertinoDialog(String text) {
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                title: new Text("Export"),
                content: new Text(text),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  )
                ],
              ));
    }

    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,

          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset('assets/crop.svg'),
            onPressed: () async {
              final croppedImage = await cropImg(picture);
              if (croppedImage != null) {
                Provider.of<Edited>(context, listen: false)
                    .update(croppedImage);
              }
            },
            iconSize: 30,
            color: Colors.black87,
          ),
          IconButton(
            icon: SvgPicture.asset('assets/slider.svg'),
            onPressed: () {},
            iconSize: 30,
            color: Colors.black87,
          ),
          IconButton(
            icon: SvgPicture.asset('assets/effects.svg'),
            onPressed: effects,
            color: Colors.black87,
            iconSize: 30,
          ),
          IconButton(
            icon: SvgPicture.asset('assets/text.svg'),
            onPressed: () {},
            iconSize: 30,
            color: Colors.black87,
          ),
          IconButton(
            icon: SvgPicture.asset('assets/export.svg'),
            onPressed: () async {
              bool success = await ImageSave.saveImage(
                picture.readAsBytesSync(),
                fileName,
              );
              if (success) {
                if (Platform.isIOS) {
                  _showCupertinoDialog("File export successful");
                } else if (Platform.isAndroid) {
                  _showMaterialDialog("File export successful");
                }
              } else {
                if (Platform.isIOS) {
                  _showCupertinoDialog("File export failed");
                } else if (Platform.isAndroid) {
                  _showMaterialDialog("File export failed");
                }
              }
            },
            iconSize: 30,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
