import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/home/home_controller.dart';

class ItemGrid extends ModularStatelessWidget {
  final int index;

  final HomeController controller = Modular.get();

  ItemGrid({this.index});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.prodList == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Card(
        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red[((index) % 10) * 100],
            /* image: DecorationImage(
              image: NetworkImage(
                controller.prodList[index].cover,
              ),
              fit: BoxFit.cover,
            ) */
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Modular.to.pushNamed('home/productsdetail',
                  arguments: controller.prodList[index]);
            },
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: controller.prodList[index].cover,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 10,
                  child: Text(
                    controller.prodList[index].name,
                    style: Theme.of(context).textTheme.subtitle,
                    // textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  bottom: -1,
                  left: -10,
                  right: -10,
                  child: Container(
                    height: 40,
                    color: Colors.black54,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'R\$${controller.prodList[index].price}',
                      style: Theme.of(context).textTheme.display4.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: -20,
                  child: RawMaterialButton(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        controller.isfavorited
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    onPressed: controller.toggleFav,
                    shape: CircleBorder(),
                    elevation: 0,
                    fillColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: -5,
                  child: Text(
                    controller.prodList[index].categoryName,
                    style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white, fontSize: 13)
                  ),
                ),
              ],
            ),
          ),
        ),
      );},
    );
  }
}
