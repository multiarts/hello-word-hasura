import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/home/components/categories_list/categories_list_widget.dart';
import 'package:hello_word/app/modules/home/components/item/item_grid.dart';
import 'package:hello_word/app/modules/home/components/item/item_widget.dart';
import 'package:hello_word/app/modules/home/home_controller.dart';
import 'package:hello_word/app/shared/components/icon_badge.dart';
import 'package:hello_word/app/shared/components/shimmer_loading.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    // controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double heightScreen = MediaQuery.of(context).size.height;

    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      // extendBody: true,
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
          Observer(
            builder: (_) => IconBadge(
              total: controller.totalCartRead,
              icon: Icons.shopping_cart,
              // size: 25,
            ),
          ),
          // IconButton(icon: Icon(Icons.refresh), onPressed: controller.refresh),
          IconButton(icon: Icon(Icons.search), onPressed: controller.refresh),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            // height: heightScreen,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  height: 180,
                  width: double.infinity,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUJzUEm17Kz3NBtbiq5MTzEVEvGRqaU5BzklRSDPeCrFpEtpnw',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                CategoriesListWidget(),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Produtos',
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                      IconButton(
                        onPressed: controller.filter == 'list'
                            ? null
                            : controller.filterList,
                        icon: Icon(Icons.view_list),
                        color: Colors.orange[900],
                      ),
                      IconButton(
                        onPressed: controller.filter == 'grid'
                            ? null
                            : controller.filterGrid,
                        icon: Icon(Icons.view_module),
                        color: Colors.orange[900],
                      ),
                    ],
                  );
                }),
                SizedBox(height: 20),
                Expanded(
                  child: Observer(
                    builder: (_) {
                      if (controller.prodList == null) {
                        return ShimmerWidget();
                      }

                      var list = controller.prodList;

                      return RefreshIndicator(
                        onRefresh: controller.refresh,
                        child: controller.filter == 'list'
                            ? ItemWidget()
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        childAspectRatio: (itemWidth / itemHeight)),
                                shrinkWrap: true,
                                itemCount: list.length,
                                itemBuilder: (_, index) => ItemGrid(
                                  index: index,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
           Positioned(
             bottom: 0,
             left: 0,
             right: 0,
             child: Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300], blurRadius: 38, offset: -Offset(0, 1)),
                ],
                borderRadius: BorderRadius.circular(50)
              ),
              child: Observer(
                builder: (_) {
                    return Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: controller.totalCart == 0
                              ? null
                              : controller.cartDecrement,
                          icon: Icon(Icons.navigate_before),
                          color: Colors.grey[900],
                        ),
                        IconButton(
                          onPressed: controller.cartIncrement,
                          icon: Icon(Icons.navigate_next),
                          color: Colors.grey[900],
                        ),
                      ],
                    );
                },
              ),
            ),
           ),
        ],
      ),
  
    );
  }
}
