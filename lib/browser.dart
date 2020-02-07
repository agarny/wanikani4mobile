import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  String _title;
  String _url;

  BrowserPage(String title, String url) {
    _title = title;
    _url = url;
  }

  @override
  _BrowserPageState createState() => _BrowserPageState(_title, _url);
}

class _BrowserPageState extends State<BrowserPage> {
  WebViewController _controller;
  String _title;
  String _url;

  _BrowserPageState(String title, String url) {
    _title = title;
    _url = url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
