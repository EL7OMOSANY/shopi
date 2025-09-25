import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

part 'share_state.dart';

class ShareCubit extends Cubit<ShareState> {
  ShareCubit() : super(ShareInitial());

  Future<void> shareProduct({
    required String title,
    required int productId,
  }) async {
    emit(ShareLoading(productId));

    try {
      // اللينك اللي بيربط المنتج داخل الابلكيشن (ممكن تعمله Dynamic Link بعدين)
      final link = "https://shopi.com/product?id=$productId";

      // النص اللي هيتبعت في المشاركة
      final text = "$title\n$link";

      // مشاركة النص مع الصورة (لو حابب تشارك صورة كمان)
      // ignore: deprecated_member_use
      await Share.share(text, subject: "Check this product from Shopi!");

      emit(ShareSuccess());
    } catch (e) {
      emit(ShareError(e.toString()));
    }
  }
}
