import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  static Future<String> httpPost(String url) async {
    Response response = await post(Uri.parse(url));
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      return response.body;
    } else {
      return "404";
    }
  }

  static Future<String> httpGet(String url) async {
    Response response = await get(Uri.parse(url));
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      return response.body;
    } else {
      return "404";
    }
  }

  static Widget emptyScreen() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'No Record Found',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget getAsset(String asset, double height, double width) {
    return Image.asset(
      asset,
      height: height,
      width: width,
    );
  }

  ///////////////// SharedPreferences ///////////////////

  static void addToSP(String dataType, String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

  //   if (dataType == Constants.int) {
  //     prefs.setInt(key, value);
  //   } else if (dataType == Constants.string) {
  //     prefs.setString(key, value);
  //   } else if (dataType == Constants.bool) {
  //     prefs.setBool(key, value);
  //   } else if (dataType == Constants.double) {
  //     prefs.setDouble(key, value);
  //   } else if (dataType == Constants.stringList) {
  //     prefs.setStringList(key, value);
  //   }
  // }

  // static void removeFromSP(String dataType, String key) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool checkValue = prefs.containsKey(key);

  //   if (checkValue) {
  //     if (dataType == Constants.int) {
  //       prefs.remove(key);
  //     } else if (dataType == Constants.string) {
  //       prefs.remove(key);
  //     } else if (dataType == Constants.bool) {
  //       prefs.remove(key);
  //     } else if (dataType == Constants.double) {
  //       prefs.remove(key);
  //     } else if (dataType == Constants.stringList) {
  //       prefs.remove(key);
  //     }
  //   }
  }
}
