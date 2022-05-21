import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twemoji/twemoji.dart';
import 'package:wordle/providers/game_state_provider.dart';
import 'package:wordle/providers/settings_provider.dart';
import 'package:wordle/widgets/wordle_bar.dart';
import 'package:wordle/widgets/wordle_grid.dart';
import 'package:wordle/widgets/wordle_keyboard.dart';

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

class WordleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: Dialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                            child: _buildDialogBody(context),
                          ),
                        );
                      });
                },
                child: const Icon(Icons.edit_off_outlined)),
          ),
        ],
        title: Text(
          'Wordle',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: HexColor("#a7bf2c"),
          ),
        ),
        centerTitle: true,
        backgroundColor: HexColor("#2c33bf"),
      ),
      body: Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [WordleBar(), WordleGrid(), WordleKeyboard()]),
      ),
    );
  }
}

void changewordsize(int x, BuildContext context) {
  Provider.of<GameState>(context, listen: false).changesize(x);
  Navigator.of(context).pop();
}

_buildDialogBody(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: HexColor("#FF9E00"),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text("Change word size",
              style: GoogleFonts.mulish(
                  fontSize: 25, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  changewordsize(4, context);
                },
                child: Text(
                  '4',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: HexColor("#2ca2bf"), // <-- Button color
                  onPrimary:
                      Color.fromARGB(255, 218, 211, 211), // <-- Splash color
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  changewordsize(5, context);
                },
                child: Text(
                  '5',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),

                  primary: HexColor("#2ca2bf"), // <-- Button color
                  onPrimary:
                      Color.fromARGB(255, 218, 211, 211), // <-- Splash color
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  changewordsize(6, context);
                },
                child: Text(
                  '6',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),

                  primary: HexColor("#2ca2bf"), // <-- Button color
                  onPrimary:
                      Color.fromARGB(255, 218, 211, 211), // <-- Splash color
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Made By Nishant Singh',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: HexColor("#120505"),
          ),
        ),
      ],
    ),
  );
}
