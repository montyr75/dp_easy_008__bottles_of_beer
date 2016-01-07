/*
 * Write a program that will print out the lyrics to "99 Bottles of Beer on the
 * Wall". Use a loop to minimize the need to type the lyrics. The song should be
 * printed using either numerals or spelled-out numbers as the user desires.
 */

// Ninety-nine bottles of beer on the wall, Ninety-nine bottles of beer.
// Take one down, pass it around, Ninety-eight bottles of beer on the wall.

library the_beer_song.web.main;

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';

import 'package:the_beer_song/views/main_app/main_app.dart';
import 'package:the_beer_song/services/logger.dart' as Logger;

const String APP_NAME = "the_beer_song";

main() async {
  Logger.log = Logger.initLog(APP_NAME);
  await initPolymer();
}
