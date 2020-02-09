import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  final String title;
  final String url;

  BrowserPage(this.title, this.url);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  static const _zoomValues = {
    -7: 0.25,
    -6: 0.33,
    -5: 0.5,
    -4: 0.67,
    -3: 0.75,
    -2: 0.8,
    -1: 0.9,
    0: 1.0,
    1: 1.1,
    2: 1.25,
    3: 1.5,
    4: 1.75,
    5: 2.0,
    6: 2.5,
    7: 3.0,
    8: 4.0,
    9: 5.0,
  };

  WebViewController _controller;

  void updateZoom() {
    setState(() {
      _controller.evaluateJavascript(
          'var scrollTop = document.documentElement.scrollTop;'
          ''
          'document.querySelector("meta[name=\'viewport\']").setAttribute("content", "width="+${MediaQuery.of(context).size.width}/${_zoomValues[Settings().webBrowserZoom]});'
          ''
          'document.documentElement.scrollTop = scrollTop;');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.youtube_searched_for),
            onPressed: (Settings().webBrowserZoom == 0)
                ? null
                : () {
                    Settings().webBrowserZoom = 0;

                    updateZoom();
                  },
          ),
          IconButton(
            icon: Icon(Icons.zoom_in),
            onPressed:
                (Settings().webBrowserZoom == _zoomValues.keys.reduce(max))
                    ? null
                    : () {
                        if (Settings().webBrowserZoom <
                            _zoomValues.keys.reduce(max)) {
                          ++Settings().webBrowserZoom;
                        }

                        updateZoom();
                      },
          ),
          IconButton(
            icon: Icon(Icons.zoom_out),
            onPressed:
                (Settings().webBrowserZoom == _zoomValues.keys.reduce(min))
                    ? null
                    : () {
                        if (Settings().webBrowserZoom >
                            _zoomValues.keys.reduce(min)) {
                          --Settings().webBrowserZoom;
                        }

                        updateZoom();
                      },
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
        onPageFinished: (_) {
          updateZoom();
        },
      ),
    );
  }
}
