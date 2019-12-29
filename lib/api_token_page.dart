import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'utilities.dart';

class ApiTokenPage extends StatefulWidget {
  @override
  ApiTokenPageState createState() => ApiTokenPageState();
}

class ApiTokenPageState extends State<ApiTokenPage> {
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
