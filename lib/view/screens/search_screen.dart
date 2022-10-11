import 'package:apiapi/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextFormField(
              onChanged: (value) {
                Provider.of<SearchProvider>(context, listen: false)
                    .getAllSearchArticle(value);
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        body: Consumer<SearchProvider>(
          builder: (context,provider, child){
            return ListView.builder(
                itemCount: provider.searchList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 20,
                    color: Color(0xff151f2c),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: Image.network(
                            provider.searchList[index].urlToImage ??
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
                                  provider.searchList[index].title,
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
                                  provider.searchList[index].description ?? "",
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
                });
          },
        ));
  }
}
