import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitFoldingCube(
      color: Colors.blueGrey,
      duration: Duration(milliseconds: 1200),
    ));
  }
}
