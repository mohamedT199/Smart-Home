import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_smart/Models/attacks.dart';
import 'package:home_smart/service/end_point/getAttacks.dart';

class AttacksList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AttacksListState();
  }

}

class AttacksListState extends State<AttacksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Smart"),
      ),
      body: getList(),
    ) ;
  }

  Future<List<Attacks>> getData() async{
    List<Attacks> attacksList = [] ;
    await GetAttacks().getAttacks().then((attacks){
      print("===================================================================");
      print(attacks) ;
      attacks.forEach((v) {
        print("===================================================================");
        print(v);
        Map<String, dynamic> data = jsonDecode(v);
        print(data) ;
        attacksList.add(Attacks.fromJson(data));
        });

    });
    print("===================================================================");
    print(attacksList) ;
    return attacksList ;
  }


  static Widget? ErrorPage() {
    return const Card(
      color: Colors.red,
      margin: EdgeInsets.zero,
      child:  Padding(
        padding:  EdgeInsets.all(8.0),
        child: Text(
          "Something is not right here ...! ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ) ;
  }

  Widget getList(){
    return FutureBuilder(
        future: getData() ,
        builder: (ctx, snapshot) {
      // Checking if future is resolved or not
      if (snapshot.connectionState == ConnectionState.done) {
        // If we got an error
        if (snapshot.hasError) {
          return Center(
            child: ErrorPage(),
          );

        } else if (snapshot.hasData) {
          // Extracting data from snapshot object
          final data = snapshot.data as List<Attacks>;
          return ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: data.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = data[index];

              return ListTile(
                leading: const Icon(Icons.accessibility_outlined),
                title: Text(item.date!),
                subtitle: Text(item.time!),
              );
            },
          );
        }
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
  });



}
}