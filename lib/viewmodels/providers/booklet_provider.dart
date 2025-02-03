import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class BookletProvider with ChangeNotifier {
  final pdfController = PdfController(
      document: PdfDocument.openAsset("assets/files/guidebook.pdf"));
  var isLoaded = true;

  void setIsLoaded(bool value) {
    isLoaded = value;
    notifyListeners();
  }
}
