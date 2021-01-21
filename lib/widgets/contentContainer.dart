import 'package:cryptocurrency/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    Key key,
    @required this.coins,
    @required List<MaterialColor> colors,
  })  : _colors = colors,
        super(key: key);

  final List<Coin> coins;
  final List<MaterialColor> _colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView.builder(
        itemCount: coins.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: _colors[index % _colors.length],
                child: Text(
                  coins[index].name[0],
                  style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 30, color: Colors.white),
                ),
              ),
              title: Text(
                coins[index].name,
                style: Theme.of(context).textTheme.headline3,
              ),
              subtitle: Text(coins[index].quote.usd.percentChange1H.toString(), style: Theme.of(context).textTheme.headline4),
            ),
          );
        },
      ),
    );
  }
}
