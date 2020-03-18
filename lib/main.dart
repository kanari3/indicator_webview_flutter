import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home:WebViewExample()));

class WebViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webview Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_to_home_screen),
            onPressed: () {
              _controller.loadUrl('https://www.google.co.jp');
            },
          ),
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(title: Text('open dialog'),);
              });
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: 'https://www.google.co.jp',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
