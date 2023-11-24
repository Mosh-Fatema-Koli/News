import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebViewScreenController extends GetxController {
  InAppWebViewController? webViewController;

  var progress = 0.0.obs;

  @override
  void dispose() {
    webViewController = null;
    super.dispose();
  }
}
