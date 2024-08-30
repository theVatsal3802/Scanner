import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultFunctions {
  static bool isUrl(String text) {
    RegExp urlCheck = RegExp(
      r"^(http|https)://([a-zA-Z0-9.-]+)(:[0-9]+)?(/.*)?$",
      caseSensitive: false,
      multiLine: false,
    );
    return urlCheck.hasMatch(text);
  }

  static Future<void> copyToClipboard(String text) async {
    await FlutterClipboard.copy(text).then(
      (_) {
        Fluttertoast.showToast(
          msg: "Copied to clipboard!",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
        );
      },
    );
  }

  static launchMyUrl(String text) async {
    Uri url = Uri.parse(text);
    await launchUrl(url);
  }
}
