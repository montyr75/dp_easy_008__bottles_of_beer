/*
 * Write a program that will print out the lyrics to "99 Bottles of Beer on the Wall". Use a
 * loop to minimize the need to type the lyrics. The song should be printed using either
 * numerals or spelled-out numbers as the user desires.
 */

// Ninety-nine bottles of beer on the wall, Ninety-nine bottles of beer.
// Take one down, pass it around, Ninety-eight bottles of beer on the wall.

library main_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../utils/string_utils.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {

  // UI data
  @observable bool spellOutNumbers = false;
  @observable String song = "";
  
  // non-visual initialization can be done here
  MainView.created() : super.created();

  // other initialization can be done here
  @override void enteredView() {
    super.enteredView();
    print("MainView::enteredView()");
  }

  void sing(Event event, var detail, Element target) {
    print("MainView::sing()");
    
    Pluralizer bottle = new Pluralizer("bottle", "bottles");
    StringBuffer sb = new StringBuffer();       // efficient String construction object
    int i = 99;                                 // iterator starts at 99 bottles
    String number;                              // String version of numeral or word form of numeral
    
    while (i > 0) {
      number = spellOutNumbers ? intToWord(i) : i.toString();
      
      sb.writeln("${capitalize(number)} ${bottle.getTerm(i)} of beer on the wall, $number ${bottle.getTerm(i)} of beer");
      
      i--;
      
      number = spellOutNumbers ? intToWord(i) : i.toString();
      
      sb.writeln("Take one down, pass it around, $number ${bottle.getTerm(i)} of beer on the wall");
      
      sb.writeln();
    }
    
    song = sb.toString();
  }

  // prevent app reload on <form> submission
  void submit(Event event, var detail, Element target) {
    event.preventDefault();
  }
}

