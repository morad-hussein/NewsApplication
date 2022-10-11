// image =  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
// const Color(0xff151f2c),
import 'package:apiapi/provider/breakingnews_provider.dart';
import 'package:apiapi/view/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreakingNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News app'),
      ),
      body:
     Consumer<BreakingNewsProvider>(
       builder: (context,provider,child){
         return provider.breakingNewsList.length==0? Center(child: CircularProgressIndicator(),):
         ListView.builder(
             itemCount: provider.breakingNewsList.length,
             itemBuilder: (context, index) {
           return GestureDetector
             (
             onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(context)=>
                  WebViewScreen(
                    url: provider.breakingNewsList[index].url,
                  ),
                  ),
                );
             },
             child: Card(
               elevation: 20,
               color: Color(0xff151f2c),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width * 0.4,
                     height: MediaQuery.of(context).size.width * 0.25,
                     child: Image.network(
                     provider.breakingNewsList[index].urlToImage??  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png",
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
                               provider.breakingNewsList[index].title,
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
                               provider.breakingNewsList[index].description?? "" ,
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
             ),
           );
         });
       },
     )
    );
  }
}
