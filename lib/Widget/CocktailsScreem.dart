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
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index].idDrink),
                                  Text(data[index].strDrink),
                                  Text(data[index].strTags),
                                  Text(data[index].strTags),
                                ]),
                          );
                        });
                  }
                })));
  }
}
