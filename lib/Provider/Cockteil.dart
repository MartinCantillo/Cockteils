import 'dart:convert';

class Cockteils {
  final String idDrink;
  final String strDrink;
  final String strTags;
  final String strCategory;
  final String strIBA;
  final String strAlcoholic;
  final String strInstructions;
  /*
  final String strInstructionsDE;
  final String strInstructionsIT;
  final String strDrinkThumb;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  final String strImageSource;
  final String strImageAttribution;
  final String strCreativeCommonsConfirmed;
  final String dateModified;
*/
  Cockteils(
      {required this.idDrink,
      required this.strDrink,
      required this.strTags,
      required this.strCategory,
      required this.strIBA,
      required this.strAlcoholic,
      required this.strInstructions
      /*
      required this.strInstructionsDE,
      required this.strInstructionsIT,
      required this.strDrinkThumb,
      required this.strIngredient1,
      required this.strIngredient2,
      required this.strIngredient3,
      required this.strMeasure1,
      required this.strMeasure2,
      required this.strMeasure3,
      required this.strImageSource,
      required this.strImageAttribution,
      required this.strCreativeCommonsConfirmed,
      required this.dateModified
      */});
  factory Cockteils.fromJson(Map<String, dynamic> json) {
    return Cockteils(
        idDrink: json['idDrink']?? '',
        strDrink: json['strDrink']?? '',
        strTags: json['strTags']?? '',
        strCategory: json['strCategory']?? '',
        strIBA: json['strIBA']?? '',
        strAlcoholic: json['strAlcoholic']?? '',
        strInstructions: json['strInstructions']?? '',
        /*
        strInstructionsDE: json['strInstructionsDE'],
        strInstructionsIT: json['strInstructionsIT'],
        strDrinkThumb: json['strDrinkThumb'],
        strIngredient1: json['strIngredient1'],
        strIngredient2: json['strIngredient2'],
        strIngredient3: json['strIngredient3'],
        strMeasure1: json['strMeasure1'],
        strMeasure2: json['strMeasure2'],
        strMeasure3: json['strMeasure3'],
        strImageSource: json['strImageSource'],
        strImageAttribution: json['strImageAttribution'],
        strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
        dateModified: json['dateModified']
        */);
  }
}
