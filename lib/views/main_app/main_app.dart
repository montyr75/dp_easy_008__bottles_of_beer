@HtmlImport('main_app.html')

library the_beer_song.lib.views.main_app;

import 'dart:html';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/paper_checkbox.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import '../../services/logger.dart';
import '../../utils/string_utils.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement {
  static const String NOTE_ICON_URL = "resources/images/note.svg";

  @property
  String song;

  @Property(notify: true, observer: 'spellOutNumbersChanged')
  bool spellOutNumbers = false;

  @Property(computed: 'isSongEmpty(song)')
  bool hideSong = true;

  MainApp.created() : super.created();

  void ready() {
    log.info("$runtimeType::ready() -- $hideSong");
  }

  @reflectable
  void sing([Event event, Map detail]) {
    log.info("$runtimeType::sing()");

    int i = 99;         // iterator starts at 99 bottles
    String number;      // String version of numeral or word form of numeral

    Pluralizer bottle = new Pluralizer("bottle", "bottles");
    StringBuffer sb = new StringBuffer();

    while (i > 0) {
      number = spellOutNumbers ? intToWord(i) : i.toString();

      sb.writeln("${capitalize(number)} ${bottle.getTerm(i)} of beer on the wall, $number ${bottle.getTerm(i)} of beer");

      i--;

      number = spellOutNumbers ? intToWord(i) : i.toString();

      sb.writeln("Take one down, pass it around, $number ${bottle.getTerm(i)} of beer on the wall");

      sb.writeln();
    }

    set('song', sb.toString());
  }

  @reflectable
  void spellOutNumbersChanged(bool newValue, bool oldValue) {
    log.info("$runtimeType::spellOutNumbersChanged()");

    if (song != null) {
      sing();
    }
  }

  @reflectable
  bool isSongEmpty(String song) => song == null || song.isEmpty;

  @property
  String get noteIconURL => NOTE_ICON_URL;
}

