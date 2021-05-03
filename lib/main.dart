import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';
import 'models/cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        //scopedModel para usuário necessário para todo o app
        model: UserModel(),
        child: ScopedModelDescendant<UserModel>(
          //ScopedModelDescendant para carrinho necessário para refazer app a cada novo usuário
          builder: (context, child, model) {
            return ScopedModel<CartModel>(
              //scopedModel para carrinho necessário para todo o app
              model: CartModel(model),
              child: MaterialApp(
                title: "Flutter's Clothing",
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    primaryColor: Color.fromARGB(255, 4, 125, 141)),
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              ),
            );
          },
        ));
  }
}
