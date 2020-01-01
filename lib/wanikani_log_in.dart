import 'package:flutter/material.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WaniKaniLogInPage extends StatefulWidget {
  @override
  WaniKaniLogInPageState createState() => WaniKaniLogInPageState();
}

class WaniKaniLogInPageState extends State<WaniKaniLogInPage> {
  static const _waniKaniApiTokenDescription = 'WaniKani for Mobile (read-only)';
  static const _waniKaniPersonalAccessTokensUrl =
      'https://www.wanikani.com/settings/personal_access_tokens';
  static const _waniKaniNewPersonalAccessTokensUrl =
      _waniKaniPersonalAccessTokensUrl + '/new';
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Log in to WaniKani'),
        ),
        body: WebView(
          initialUrl: _waniKaniPersonalAccessTokensUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller = controller;

            _controller.clearCache();
          },
          onPageFinished: (String url) {
            if (url == _waniKaniPersonalAccessTokensUrl) {
              _controller
                  .evaluateJavascript(
                      '\$(".personal-access-token-description:contains(\'$_waniKaniApiTokenDescription\') ~ .personal-access-token-token > code:eq(0)").text().trim()'
                      '|| \$(".personal-access-token-token > code:eq(0)").text().trim();')
                  .then((apiToken) {
                if (apiToken.isEmpty) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('API token'),
                      content: Text(
                        'No API token could be found.'
                        'Would you like to generate one now?',
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () => Navigator.pop(context, 'Yes'),
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () => Navigator.pop(context, 'No'),
                        ),
                      ],
                    ),
                  ).then((returnVal) {
                    if (returnVal == 'Yes') {
                      _controller.loadUrl(_waniKaniNewPersonalAccessTokensUrl);
                    } else {
                      Navigation().navigateTo(LogInRoute);
                    }
                  });
                } else {
                  Settings().apiToken = apiToken;

                  Navigation().navigateTo(HomeRoute);
                }
              });
            } else if (url == _waniKaniNewPersonalAccessTokensUrl) {
              _controller
                  .evaluateJavascript(
                      'function parseHiddenInputs(index, element) {'
                      '  data[element.attributes.name.value] = element.attributes.value.value;'
                      '}'
                      ''
                      'function parseCheckboxes(index, element) {'
                      '  data[element.attributes.name.value] = "0";'
                      '}'
                      ''
                      'var form = \$("form.new_personal_access_token");'
                      'var data = {};'
                      ''
                      '\$("input[type=\'hidden\']").each(parseHiddenInputs);'
                      'form.find("input[type=\'checkbox\']").each(parseCheckboxes);'
                      'data["personal_access_token[description]"] = "$_waniKaniApiTokenDescription";'
                      ''
                      '\$.post(form.attr("action"), data);'
                      ''
                      '"Return a string to make WebViewController.evaluateJavascript() happy."')
                  .then((_) {
                _controller.loadUrl(_waniKaniPersonalAccessTokensUrl);
              });
            }
          },
        ));
  }
}
