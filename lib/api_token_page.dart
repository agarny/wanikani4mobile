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
        margin: EdgeInsets.all(space),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Your ',
                      style: bodyStyle(context),
                    ),
                    LinkTextSpan(
                      text: 'API token',
                      style: linkStyle(context),
                      urlOrRoute:
                          'https://www.wanikani.com/settings/personal_access_tokens',
                    ),
                    TextSpan(
                      text:
                          ' is needed by WaniKani for Mobile to interact with WaniKani.',
                      style: bodyStyle(context),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: space),
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
