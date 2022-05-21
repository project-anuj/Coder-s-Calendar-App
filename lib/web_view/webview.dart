

import 'dart:io';

import 'package:coders_calendar/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String url;
  String title;

  WebViewPage({required this.url,required this.title});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text(widget.title),),
          body: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
          )
      ),
    );
  }
}
