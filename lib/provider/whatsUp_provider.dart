import 'package:url_launcher/url_launcher.dart';

class WhatsAppProvider {
  Future<void> openWhatsAppChat(String phone, String message) async {
    var whatsappUrl =
        "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print("Download it");
    }
  }
}
