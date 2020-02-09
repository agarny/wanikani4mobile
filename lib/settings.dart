import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/application.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Settings extends ChangeNotifier {
  static final Settings _instance = Settings._();

  SharedPreferences _prefs;
  static const _WebBrowserZoomPref = 'Web browser zoom';
  static const _emailAddressPref = 'E-mail address';
  static const _apiTokenPref = 'API token';

  factory Settings() {
    return _instance;
  }

  Settings._();

  Settings.init(SharedPreferences prefs) {
    _instance._prefs = prefs;
  }

  int get webBrowserZoom => _prefs?.getInt(_WebBrowserZoomPref) ?? 0;

  set webBrowserZoom(int value) {
    _prefs?.setInt(_WebBrowserZoomPref, value);

    notifyListeners();
  }

  String get emailAddress => _prefs?.getString(_emailAddressPref) ?? '';

  set emailAddress(String value) {
    _prefs?.setString(_emailAddressPref, value);

    notifyListeners();
  }

  String get apiToken => _prefs?.getString(_apiTokenPref) ?? '';

  set apiToken(String value) {
    _prefs?.setString(_apiTokenPref, value);

    notifyListeners();
  }

  void reset() {
    _prefs.clear();
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton.icon(
                icon: Icon(
                  WaniKani().active() ? Icons.stop : Icons.play_arrow,
                  size: Theme.of(context).textTheme.subhead.fontSize,
                ),
                label: Text(WaniKani().active()
                    ? 'Activate vacation mode'
                    : 'Deactivate vacation mode'),
                onPressed: () {
                  _controller
                      .evaluateJavascript(
                          'document.getElementById("vacation-btn").click();')
                      .then((_) {
                    WaniKani().fetch().then((_) {
                      setState(() {});
                    });
                  });
                },
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonPadding: EdgeInsets.all(0),
            children: <Widget>[
              RaisedButton.icon(
                icon: Image.asset(
                  LogOut,
                  width: Theme.of(context).textTheme.subhead.fontSize,
                ),
                label: Text('Log out'),
                onPressed: () {
                  Application.reset(resetAll: true);

                  Navigation().navigateTo(LogInRoute);
                },
              ),
            ],
          ),
          Container(
            height: 0,
            child: WebView(
              initialUrl: WaniKaniAccountUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _controller = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
