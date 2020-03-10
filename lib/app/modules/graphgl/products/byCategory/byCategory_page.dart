import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hello_word/app/shared/data/grl_products.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ByCategoryPage extends StatefulWidget {
  final String title;
  final int code;
  const ByCategoryPage({Key key, this.title = "ByCategory", this.code}) : super(key: key);

  @override
  _ByCategoryPageState createState() => _ByCategoryPageState();
}

class _ByCategoryPageState extends State<ByCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Query(
      options: QueryOptions(
        documentNode: gql(GrlProducts.byCategory),
        variables: <String, dynamic>{"code": widget.code}
      ), 
      builder: (
        QueryResult result,
        {VoidCallback refetch, FetchMore fetchMore}
      ){
        if(result.hasException){
          return Text(result.exception.toString());
        }
        if(result.loading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(result.data == null) Text('Porra nenhuma aqui');

        final List<LazyCacheMap> products = (result.data['products'] as List<dynamic>).cast<LazyCacheMap>();

        return ListView.builder(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          itemCount: products.length,
          itemBuilder: (_, index){
            dynamic responseData = products[index];
            dynamic vote = responseData['products_stars_aggregate']['aggregate']['avg']['vote'];
            return Card(
              margin: EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              ),
              elevation: 6,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: responseData['image'] == "" ? NetworkImage('https://vespa.tours/wp-content/themes/saigon.travel/images/no-image.jpg') : NetworkImage(
                          responseData['image']
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(6)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: -2,
                    right: -2,
                    child: ClipRRect(
                      borderRadius:  BorderRadius.vertical(
                        bottom: Radius.circular(6)
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 3,
                          sigmaY: 3
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(.4),
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Text(
                            responseData['title'],
                            style: Theme.of(context).textTheme.headline.copyWith(
                              color: Colors.white,
                              fontFamily: "Nexa Script W00 Regular"
                            ),
                            textAlign: TextAlign.center,
                          ),                          
                        ),
                      ),
                    )
                  ),
                  /* Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(                        
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(6)
                      ),
                    ),
                      child: Text(
                        responseData['title'],
                        style: Theme.of(context).textTheme.headline.copyWith(
                          color: Colors.white,
                          fontFamily: "Nexa Script W00 Regular"
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ), */

                  // Favorite button
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Icon(Icons.favorite_border, color: Colors.redAccent.shade200,),
                    ),
                  ),

                  // price
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.orangeAccent,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black26,
                            offset: Offset(1, 1)
                          )
                        ]
                      ),
                      child: Text(
                        "R\$"+responseData['price'].toStringAsFixed(2).replaceAll('.',','),
                        style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
                      )
                    ),
                  ),

                  // rating
                  Positioned(
                    bottom: 8,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: SmoothStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: vote == null ? 0 : vote,
                        size: 16,
                        spacing: 0,
                        borderColor: Colors.amber.shade800,
                        color: Colors.amber.shade800,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
      )
    );
  }
}
