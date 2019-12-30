import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/utilities.dart';

class WaniKaniApiTokenPage extends StatefulWidget {
  @override
  WaniKaniApiTokenPageState createState() => WaniKaniApiTokenPageState();
}

class WaniKaniApiTokenPageState extends State<WaniKaniApiTokenPage> {
  static const mask = '########-####-####-####-############';
  final inputFormatter = MaskTextInputFormatter(
    mask: mask,
    filter: {
      "#": RegExp(r'[0-9a-f]'),
      "-": RegExp(r'\-'),
    },
  );
  final _apiTokenRegExpr =
      RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$');

  String _apiKey;
  bool _buttonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter my API token'),
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
              onChanged: (String value) {
                if (_apiTokenRegExpr.hasMatch(value) != _buttonEnabled) {
                  setState(() {
                    _apiKey = value;
                    _buttonEnabled = !_buttonEnabled;
                  });
                }
              },
            ),
            OutlineButton(
              child: Text('Log in'),
              onPressed: _buttonEnabled
                  ? () {
                      Provider.of<Settings>(context, listen: false)
                          .setApiToken(_apiKey);

                      GetIt.instance<NavigationService>().navigateTo(HomeRoute);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
