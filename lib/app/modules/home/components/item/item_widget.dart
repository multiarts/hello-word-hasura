import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/home/home_controller.dart';

class ItemWidget extends ModularStatelessWidget {
  
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.prodList == null) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          addAutomaticKeepAlives: true,
          // primary: false,
          itemCount: controller.prodList.length,
          itemBuilder: (_, index) {
            return index%8 == 0 
            ? Container(
              color: Colors.red,
              height: 60,
              child: Text(''),
            ) 
            : Container(
              padding: EdgeInsets.symmetric(vertical:5),
              child: Row(
                children: <Widget>[
                  /// Container numbers
                  Container(
                    width: 50,
                    height: 50,
                    // color: Colors.grey[500],
                    alignment: Alignment.center,
                    child: Text(
                      '$index'.padLeft(2,'0'),
                      style: Theme.of(context).textTheme.headline
                    ),
                  ),
                  SizedBox(width: 5),
                  /// Container card
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      Modular.to.pushNamed('home/productsdetail',
                  arguments: controller.prodList[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 10, 5, 8),
                      margin: EdgeInsets.only(bottom: 12),
                      width: MediaQuery.of(context).size.width * .8,
                      decoration: BoxDecoration(
                        color: Color(0xFFEFF3F6),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 3,
                            offset: Offset(4, 2),
                            color: Color.fromRGBO(0, 0, 0, .1)
                          ),
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 3,
                            offset: -Offset(4, 2),
                            color: Color.fromRGBO(255, 255, 255, .9)
                          ),
                        ]
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  controller.prodList[index].name,
                                  style: Theme.of(context).textTheme.button,
                                ),
                                // SizedBox(height: 16),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  // color: Colors.primaries[index % Colors.primaries.length],
                                  child: Text(
                                    "R\$${controller.prodList[index].price}",
                                    style: Theme.of(context).textTheme.body1.copyWith(color: Colors.primaries[index % Colors.primaries.length], fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            children: <Widget>[
                              RawMaterialButton(
                                onPressed: controller.toggleFav,
                                elevation: 2,
                                fillColor: Colors.white,
                                shape: CircleBorder(),
                                child: Icon(Icons.favorite),
                              ),
                              SizedBox(height: 6),
                              Text(
                                controller.prodList[index].categoryName,
                                style: Theme.of(context).textTheme.button,
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          }
        );
      },
    );
  }
}
