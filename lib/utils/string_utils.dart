library string_utils;

// numbers under 20 expressed in word form
final List<String> ones = [
  "no",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten",
  "eleven",
  "twelve",
  "thirteen",
  "fourteen",
  "fifteen",
  "sixteen",
  "seventeen",
  "eighteen",
  "nineteen"
];

// tens expressed in word form
final List<String> tens = [
  null,
  null,
  "twenty",
  "thirty",
  "forty",
  "fifty",
  "sixty",
  "seventy",
  "eighty",
  "ninety"
];

// function to translate an integer from 0 to 99 into its word form
String intToWord(int number) {
  assert(number >= 0 && number <= 99);
  
  StringBuffer sb = new StringBuffer();
  
  if (number < 20) {
    sb.write(ones[number]);
  }
  else {
    sb.write(tens[(number / 10).floor()]);
    
    if (number % 10 != 0) {
      sb.write("-");
      sb.write(ones[number % 10]);
    }
  }
  
  return sb.toString();
}

// capitalizes first letter of 'data'
String capitalize(String data) {
  String cap = data[0].toUpperCase();
  
  if (data.length > 1) {
    return "$cap${data.substring(1)}";
  }
  
  return cap;
}

// provides the correct term for pluralization
class Pluralizer {
  String singular;
  String plural;
  
  Pluralizer(String this.singular, String this.plural);
  
  String getTerm(int numberOfItems) => numberOfItems == 1 ? singular : plural;
}