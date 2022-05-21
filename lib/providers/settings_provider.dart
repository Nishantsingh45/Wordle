import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class GameSettings extends ChangeNotifier {
  int wordsize;
  int attempts;
  double level;
  int idx;
  int currstreak;
  int curattempts;

  Map<String, Color> mp = Map();
  bool isexceeded = false;
  GameSettings(
      {this.curattempts = 0,
      this.wordsize = 5,
      this.attempts = 6,
      this.level = 1.0,
      this.idx = 0,
      this.currstreak = 0});

  void updateattempts() {
    attempts--;
    notifyListeners();
  }

  void setmp(String letter, Color c) {
    mp[letter] = c;
    print("hashmap ${mp}");
    notifyListeners();
  }

  Color getKeyColor(String letter) {
    var x =
        mp != null && mp.containsKey(letter) ? mp[letter] : HexColor("#FF9E00");

    return x;
  }

  void mpclear() {
    mp.clear();
    notifyListeners();
  }

  void updatelevel() {
    double x = double.parse((level).toStringAsFixed(1));
    if (x == 1.3) {
      level = 2;
      updateattempts();
    } else if (x == 2.3) {
      level = 3;
      updateattempts();
    } else if (x == 3.3) {
      level = 4;
      updateattempts();
    } else {
      level = level + 0.1;
    }
    notifyListeners();
    print("level updated $level");
  }

  void resetstreak() {
    currstreak = 0;
    notifyListeners();
  }

  void changeWordSize(int x) {
    wordsize = x;
    notifyListeners();
  }

  void incrementstreak() {
    currstreak++;
    notifyListeners();
  }

  void incrementidx(int x) {
    idx = x;
    notifyListeners();
  }

  void updatewordssize(int wordsize) {
    wordsize = wordsize;
    notifyListeners();
  }

  void resetcurrattempts() {
    curattempts = 0;
    notifyListeners();
  }

  void updatecurattempts() {
    curattempts++;
    if (curattempts > attempts) {
      isexceeded = true;
    }

    notifyListeners();
  }
}
