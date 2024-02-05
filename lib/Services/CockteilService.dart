import 'dart:convert';

import 'package:cocktails/Provider/Cockteil.dart';
import 'package:http/http.dart' as http;

class CockteilService{
  static Future<List<Cockteils> >fetchCockteiList()async{
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'));
    if(response.statusCode==200){
      final List<dynamic> data = jsonDecode(response.body)['drinks'];
      List<Cockteils>CockteilsList=data.map((e) => Cockteils.fromJson(e)).toList();
      return CockteilsList;
      
    }else{
       throw Exception("Error del servidor ${response.statusCode}");
    }
    
  }
}