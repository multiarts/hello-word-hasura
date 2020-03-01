import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/home/home_controller.dart';
import 'package:hello_word/app/shared/components/icon_badge.dart';
import 'package:hello_word/app/shared/models/products_model.dart';

class DetailPage extends StatefulWidget {
  final ProductsModel items;
  DetailPage({this.items});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.items.name),
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
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          // color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300], blurRadius: 38, offset: -Offset(0, 1)),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 50,
                child: RaisedButton.icon(
                  onPressed: controller.cartIncrement,
                  icon: Icon(Icons.shopping_basket),
                  label: Text('Adicionar no carrinho'),
                  color: Colors.grey[700],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: RaisedButton.icon(
                  onPressed:(){},
                  icon: Icon(Icons.payment),
                  label: Text('Finalizar pedido'),
                  color: Colors.orange.shade900,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Material(
                elevation: 6,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black45, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: CachedNetworkImage(
                    imageUrl: widget.items.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.white, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: -20,
                  right: 0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    elevation: 8,
                    fillColor: Colors.grey[50],
                    shape: CircleBorder(),
                  ))
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(widget.items.name,
                        style: Theme.of(context).textTheme.headline),
                    Text('${widget.items.price}'.replaceAll('.', ','),
                        style: Theme.of(context).textTheme.title),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    )
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.items.description,
                  style: Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
                ),
                SizedBox(height: 40),
                Observer(builder: (_) {
                  return Material(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(15),
                    borderOnForeground: true,
                    elevation: 10,
                    shadowColor: Colors.grey[200],
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade600,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[                              
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  iconSize: 25,
                                  onPressed:
                                      controller.qty == 1 ? null : controller.decrement,
                                ),
                                Text(
                                  '${controller.qty}',
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  iconSize: 25,
                                  onPressed: controller.increment,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'R\$${widget.items.price * controller.qty}'.replaceAll('.', ','),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
