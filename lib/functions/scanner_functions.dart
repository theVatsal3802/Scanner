import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerFunctions {
  static Future<String> scanQrCode() async {
    String result = await FlutterBarcodeScanner.scanBarcode(
      "#673AB7",
      "Cancel",
      true,
      ScanMode.QR,
    );
    return result;
  }

  static Future<String> scanBarcode() async {
    String result = await FlutterBarcodeScanner.scanBarcode(
      "#673AB7",
      "Cancel",
      true,
      ScanMode.BARCODE,
    );
    return result;
  }
}
