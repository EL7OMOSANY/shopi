import 'dart:async';
import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/di/di.dart'
    // ignore: library_prefixes
    as NavigatorService; // Import the DI file
import 'package:shopi/core/routes/routes.dart';

class DeepLinkService {
  final AppLinks _appLinks;
  DeepLinkService(this._appLinks);

  StreamSubscription<Uri>? _linkSubscription;

  Future<void> init() async {
    // 1. handle the initial deep link if the app was opened by one
    // دي هتشتغل مرة واحدة بس لما التطبيق يفتح لأول مرة عن طريق لينك
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _handleUri(initialUri);
    }

    // 2. handle subsequent deep links while the app is running
    // دي هتشتغل لما التطبيق يكون شغال ويجيله لينك جديد
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _handleUri(uri);
    });
  }

  void _handleUri(Uri uri) {
    log("🔗 Received URI: $uri");

    final context = NavigatorService.navigatorKey.currentContext;

    if (context == null) {
      log("🚫 Error: Navigator context is not available yet.");
      return;
    }

    String? productId;
    if (uri.scheme == "shopi" && uri.host == "product") {
      productId = uri.queryParameters["id"];
    } else if (uri.host == "shopi.com" &&
        uri.pathSegments.contains("product")) {
      productId =
          uri.queryParameters["id"] ??
          (uri.pathSegments.length > 1 ? uri.pathSegments[1] : null);
    }

    if (productId == null) {
      return;
    }

    final int newProductId = int.tryParse(productId) ?? -1;
    if (newProductId == -1) {
      return;
    }

    // ✅ استخدام pushReplacementNamed لحل مشكلة التكرار
    Navigator.of(context).pushReplacementNamed(
      Routes.customerProductDetails,
      arguments: newProductId,
    );

    log("✅ Navigated to product route with ID: $newProductId");
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
