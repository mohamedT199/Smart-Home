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
  int page = 1 ;
  int start = 1 ;
  int end = 10 ;
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
      attacks.forEach((v) {
        print("====================");
        //Map<String, dynamic> data = jsonDecode(v);
        print("====================");
        attacksList.add(Attacks.fromJson(v));
        });

    });
    return attacksList;
    return attacksList.getRange(0, 10).toList() ;
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
          List<Attacks> allAttacks = snapshot.data as List<Attacks>;
          allAttacks = List.from(allAttacks.reversed) ;
          List<Attacks> data = allAttacks.getRange(start, end).toList() ;
          return Column(
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                  shrinkWrap: true,
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
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.black)
                      ),
                      //color: Colors.indigo,
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15 , vertical: 5),
                        child: Text("Pages" , style: TextStyle() , textAlign: TextAlign.center ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: (allAttacks.length / 10).floor(),
                        itemBuilder: (context , index){
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration:  BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Colors.black) ,
                                  color: index == page -1  ? Colors.indigo : null  ,

                                ),
                                width: 30,
                                //color: Colors.indigo,
                                child: GestureDetector(
                                  onTap: (){

                                    page = index + 1  ;
                                    end = allAttacks.length - (10 * page) < 10 ?  allAttacks.length :  10 * page ;
                                    start = (end % 10 ) == 0 ?  end - 10 : ((10 * page) - 10)  ;
                                    print(page);
                                    print(end);
                                    print(start);
                                    setState(() {

                                    });

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text((index + 1 ).toString() , style: const TextStyle(color: Colors.indigo ,decoration: TextDecoration.underline, ) , textAlign: TextAlign.center ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
  });



}
}