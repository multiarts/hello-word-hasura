import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/home/home_controller.dart';

class CategoriesListWidget extends StatelessWidget {
  final HomeController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: double.infinity,
        // color: Colors.redAccent,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Observer(builder: (_) {
          if (controller.prodList == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoriesList.length,
            itemBuilder: (_, i) {
              return  Container(
                height: 20,
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey[300]
                    )
                  ]
                ),
                child: Text(
                  controller.categoriesList[i].name
                ),
              );
            },
          );
        }));
  }
}
