import 'package:cryptocurrency/service/getData.dart';
import 'package:cryptocurrency/widgets/contentContainer.dart';
import 'package:cryptocurrency/widgets/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetData _getData = GetData();
  List<MaterialColor> _colors = [Colors.blue, Colors.amber, Colors.pink];
  List<Coin> coins = List<Coin>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRYPTOOO"),
        centerTitle: true,
      ),
      body: buildFutureBuilder(),
    );
  }

  FutureBuilder<List<Coin>> buildFutureBuilder() {
    return FutureBuilder(
      future: _getData.getCoins(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          coins = snapshot.data;
          if (snapshot.data == null) {
            return Text("null");
          } else {
            return ContentContainer(coins: coins, colors: _colors);
          }
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Spinner();
        }
      },
    );
  }
}
