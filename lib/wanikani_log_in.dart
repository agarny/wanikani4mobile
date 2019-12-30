import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WaniKaniLogInPage extends StatefulWidget {
  @override
  WaniKaniLogInPageState createState() => WaniKaniLogInPageState();
}

class WaniKaniLogInPageState extends State<WaniKaniLogInPage> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    const ApiTokenUrl = 'https://www.wanikani.com/settings/personal_access_tokens';

    return Scaffold(
        appBar: AppBar(
          title: Text('Log in to WaniKani'),
        ),
        body: WebView(
          initialUrl: ApiTokenUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller = controller;

            _controller.clearCache();
          },
          onPageFinished: (String url) {
            if (url == ApiTokenUrl) {
              _controller
                  .evaluateJavascript(
                  '\$(".personal-access-token-token > code").text().trim();')
                  .then((apiToken) {
                Provider.of<Settings>(context, listen: false)
                    .setApiToken(apiToken);

                navigateTo(HomeRoute);
              });
            }
          },
        ));
  }
}
