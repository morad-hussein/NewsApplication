


import 'package:apiapi/provider/sports_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<SportsProvider>
      (builder: (context,provider,child){
       return Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.black,
           title: Text("Sports"),
         ),
         body:  ListView.builder(
             itemCount: provider.sportList.length,
             itemBuilder: (context, index) {
               return Card(
                 elevation: 20,
                 color: Color(0xff151f2c),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       width: MediaQuery
                           .of(context)
                           .size
                           .width * 0.4,
                       height: MediaQuery
                           .of(context)
                           .size
                           .width * 0.25,
                       child: Image.network(
                         provider.sportList[index].urlToImage ??
                             "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png",
                         fit: BoxFit.cover,
                       ),
                     ),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Directionality(
                             textDirection: TextDirection.rtl,
                             child: Text(
                               provider.sportList[index].title,
                               style: TextStyle(
                                 fontSize: 20,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Directionality(
                             textDirection: TextDirection.rtl,
                             child: Text(
                               provider.sportList[index].description ??
                                   "",
                               style: TextStyle(
                                 fontSize: 20,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               );
             }
         )
       );
    });
  }
}

