import 'package:cocktails/Provider/Cockteil.dart';
import 'package:cocktails/Services/CockteilService.dart';
import 'package:flutter/material.dart';

class CocktailScreem extends StatefulWidget {
  const CocktailScreem({super.key});

  @override
  State<CocktailScreem> createState() => _CocktailScreemState();
}

class _CocktailScreemState extends State<CocktailScreem> {
  late Future<List<Cockteils>> CockteilsList;
  @override
  void initState() {
    super.initState();
    //Hacer la peticion
    CockteilsList = CockteilService.fetchCockteiList();
    //print('CockteilsList === ${{CockteilService.fetchCockteiList()}}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Cockteils", style: TextStyle(color: Colors.white)),
            ),
            drawer: Drawer(backgroundColor: Colors.black),
            body: FutureBuilder(
                future: CockteilsList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else {
                    List<Cockteils> data = snapshot.data as List<Cockteils>;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
  title: Text(
    data[index].strDrink,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
  ),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 4.0),
      Row(
        children: [
          Icon(Icons.confirmation_number, size: 16.0),
          Text(' ID: ${data[index].idDrink}', style: TextStyle(fontSize: 14.0)),
        ],
      ),
      Row(
        children: [
          Icon(Icons.category, size: 16.0),
          Text(' Categoría: ${data[index].strCategory}', style: TextStyle(fontSize: 14.0)),
        ],
      ),
      Row(
        children: [
          Icon(Icons.liquor, size: 16.0),
          Text(' Tipo: ${data[index].strAlcoholic}', style: TextStyle(fontSize: 14.0)),
        ],
      ),
      Row(
        children: [
          Icon(Icons.tag, size: 16.0),
          Text(' Tags: ${data[index].strTags}', style: TextStyle(fontSize: 14.0)),
        ],
      ),
      Row(
        children: [
          Icon(Icons.local_bar, size: 16.0),
          Text(' IBA: ${data[index].strIBA}', style: TextStyle(fontSize: 14.0)),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.directions, size: 16.0),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                ' Instrucciones: ${data[index].strInstructions}',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
        ],
      ),
      
    ],
  ),
);

                        });
                  }
                })));
  }
}
