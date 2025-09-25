import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> shareProduct({
    required int productId,
    required String title,
  }) async {
    // لو شغال https app link
    final url = "https://shopi.com/product/$productId";

    // أو لو custom scheme
    // final url = "shopi://product/$productId";

    // ignore: deprecated_member_use
    await Share.share(
      "$title\n\nشوف المنتج هنا 👇\n$url",
      subject: "منتج من Shopi",
    );
  }
}
