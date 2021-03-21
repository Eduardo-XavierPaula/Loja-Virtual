import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:loja_virtual/screens/product_screen.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ProductScreen(product))
        );
      },
        child: Card(
      child: type == "grid"
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 0.8,
                  child: Image.network(
                    product.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        product.title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("R\$ ${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Theme.of(context).primaryColor,
                          )),
                    ]),
                  ),
                )
              ],
            )
          : Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.network(
                    product.images[0],
                    fit: BoxFit.cover,
                    height: 200.0,
                  )
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        product.title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("R\$ ${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Theme.of(context).primaryColor,
                          )),
                    ]),
                  ),
                ),
              ],
            ),
    ));
  }
}
