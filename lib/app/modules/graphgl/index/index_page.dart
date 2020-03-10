import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hello_word/app/shared/components/custom_chip.dart';
import 'package:hello_word/app/shared/components/icon_badge.dart';
import 'package:hello_word/app/shared/components/shimmer_loading.dart';
import 'package:hello_word/app/shared/data/grl_products.dart';
import 'package:hello_word/app/shared/services/shared_preferences_service.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'index_controller.dart';

class IndexPage extends StatefulWidget {
  final String title;
  const IndexPage({Key key, this.title = "Jhone Burger"}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final IndexController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				leading: Icon(Icons.menu),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Jhone',
            style: TextStyle(
              // textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.orange,
            ),
            children: [
              TextSpan(
                text: 'Burger',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              TextSpan(
                text: 'Beer',
                style: TextStyle(color: Colors.orange, fontSize: 30),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          /* IconBadge(
            total: '2',
            icon: Icons.shopping_cart,
            // size: 25,
          ), */
          
          IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){}),
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: controller.logoff),
        ],
				// backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        
			),
			body: ListView(
				children: <Widget>[
					ListCategories(),
					SizedBox(height: 15),
					ListProducts()
				],
			),
		);
  }
}

class ListProducts extends StatelessWidget {
	final IndexController controller = Modular.get();
	
  @override
  Widget build(BuildContext context) {
    return Observer(
			builder: (_){
				return Query(
					options: QueryOptions(
						documentNode: gql(
							GrlProducts.chooseCategory(
								controller.selectedIndex == 1 ? null : controller.selectedIndex
							)
						),
					),
					builder: (
          QueryResult result,
						{Future<QueryResult> Function() refetch, FetchMore fetchMore}) {
						if (result.hasException) {
              print(result.exception);
							return Column(
							  children: <Widget>[
							    Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        result.exception.toString(),
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        sharedPreferenceService.token.toString(),
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    )
                  ),
							  ],
							);
						}
						if (result.loading) {
							return ShimmerWidget();
						}
						// List repositories = result.data['products_aggregate']['nodes'];
						List repositories = result.data['products'];

						return Container(
							height: MediaQuery.of(context).size.height - 100,
							child: ListView.builder(
								padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
								// addAutomaticKeepAlives: true,
								itemCount: repositories.length,
								itemBuilder: (context, index) {
									final repository = repositories[index];
									final vote = repository['products_stars_aggregate']
											['aggregate']['avg']['vote'];

									return GestureDetector(
										behavior: HitTestBehavior.opaque,
										onTap: () {
											print(repository['category_id']);
											Modular.to.pushNamed('/index/bycategory',
													arguments: repository['category_id']);
										},
										child: Container(
											margin: EdgeInsets.only(bottom: 20),
											decoration: BoxDecoration(
												// color: Theme.of(context).cardColor,
												borderRadius: BorderRadius.circular(5),
												/* boxShadow: [
													/* BoxShadow(
															blurRadius: 10,
															color: Color(0xFFFFFFFF),
															offset: -Offset(5, 5)), */
													BoxShadow(
															blurRadius: 2,
															// color: Color(0xFFD3D1D2),
															color: Color(0xFF00a9b9),
															offset: Offset(1, 1),
													),
												], */
											),
											child: Column(
												children: <Widget>[
													ListTile(
														leading: ClipRRect(
															borderRadius: BorderRadius.circular(40),
														  child: Container(
														  	width: 45,
														  	height: 45,
														  	decoration: BoxDecoration(
														  		shape: BoxShape.circle
														  	),
														  	child: repository['image'] == ""
														  		? FadeInImage.assetNetwork(placeholder: 'assets/images/no-image.jpg', image: 'assets/images/no-image.jpg',fit: BoxFit.cover,) 
														  		: FadeInImage.assetNetwork(placeholder: 'assets/images/no-image.jpg', image: repository['image'], fit: BoxFit.cover,),
														  ),
														),
														title: Row(
															mainAxisAlignment: MainAxisAlignment.spaceBetween,
															children: <Widget>[
																Flexible(
																  child: Text(
																  	repository['title'],
																  	style: TextStyle(
																  		color: Color(0xFF00a9b9),
																  		fontSize: 20,
                                      fontFamily: "Nexa Script W00 Regular",
																  		fontWeight: FontWeight.w500
																  	),
																  ),
																),
																Text("R\$" +
																	repository['price'].toStringAsFixed(2).replaceAll('.', ','),
																	style: TextStyle(
																		color: Color(0xFF00a9b9), fontSize: 18,
																	),
																),
															],
														),
														subtitle: Row(
															mainAxisAlignment: MainAxisAlignment.spaceBetween,
															children: <Widget>[
																Text(
																	repository['description'],
																	style: TextStyle(color: Color(0xFF00a9b9)),
																),
																SmoothStarRating(
																	rating: vote == null ? 0 : vote,
																	size: 16,
																	borderColor: Colors.amber.shade800,
																	color: Colors.amber.shade800,
																)
															],
														),
													),
													SizedBox(height: 1),
													Container(
														height: 1,
														// width: double.infinity,
														decoration: BoxDecoration(
															gradient: LinearGradient(
																colors: [
																	Colors.transparent,
																	Color(0xffe7281f),
																	Color(0xfff16908),
																	Colors.transparent
																],
															)
														),
													)
												],
											),
										),
									);
								},
							),
						);
					},
				);
			}
		);
  }
}

class ListCategories extends StatelessWidget {
  final IndexController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Query(
    	options: QueryOptions(
    		documentNode: gql(GrlProducts.categories),
    	),
    	builder: (QueryResult result,	{Future<QueryResult> Function() refetch, FetchMore fetchMore}) {
    		if (result.hasException) {
    			return Text(result.exception.toString());
    		}
    		if (result.loading) {
    			return ShimmerWidget();
    		}
    		// List repositories = result.data['categories'];
    		final List<LazyCacheMap> repositories =	(result.data['categories'] as List<dynamic>).cast<LazyCacheMap>();

    		return Container(
    			height: 65,
    			// color: Colors.yellow,
    			child: ListView.builder(
    				// reverse: true,
    					scrollDirection: Axis.horizontal,
    					padding: EdgeInsets.fromLTRB(10, 15, 15, 15),
    					// addAutomaticKeepAlives: true,
    					itemCount: repositories.length,
    					itemBuilder: (context, index) {
    						final repository = repositories[index];
    						// List categories = repository['products'];

    						return  Observer(builder: (_) {
    								return CustomChipWidget(
    									index: index,
    									label: repository['title'],
    									selected: controller.selectedIndex == repository['id'],
    									onSelected: () => controller.changeIndex(repository['id']),
    								);
    							},
    						);
    					},
    			),
    		);
    	},
    );
  }
}

/*

Container(
	padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
	margin: EdgeInsets.only(right: 10),
	alignment: Alignment.center,
	decoration: BoxDecoration(
		borderRadius: BorderRadius.circular(16),
		color: Colors.primaries[index % Colors.primaries.length],
		boxShadow: [
			BoxShadow(
				blurRadius: 10,
				color: Colors.primaries[index % Colors.primaries.length],
			)
		]
	),
	child: Text(
			repository['title'],
			style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white,
			fontWeight: FontWeight.w600,
		),                          
	),
),


*/
