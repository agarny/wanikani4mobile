import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wanikani4mobile/utilities.dart';

class WaniKaniApiTokenPage extends StatefulWidget {
  @override
  WaniKaniApiTokenPageState createState() => WaniKaniApiTokenPageState();
}

class WaniKaniApiTokenPageState extends State<WaniKaniApiTokenPage> {
  @override
  Widget build(BuildContext context) {
    const mask = '########-####-####-####-############';
    final inputFormatter = MaskTextInputFormatter(
      mask: mask,
      filter: {
        "#": RegExp(r'[0-9a-f]'),
        "-": RegExp(r'[\-]'),
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter API token'),
      ),
      body: Container(
        margin: EdgeInsets.all(space(context)),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                  'Your API token is needed by WaniKani for Mobile to interact with WaniKani.'),
            ),
            SizedBox(height: space(context)),
            TextField(
              decoration: InputDecoration(
                labelText: "API token",
                hintText: mask,
              ),
              inputFormatters: [inputFormatter],
            ),
          ],
        ),
      ),
    );
  }
}
