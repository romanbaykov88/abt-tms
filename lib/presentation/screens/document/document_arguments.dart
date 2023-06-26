import 'package:googleapis/drive/v3.dart';

class DocumentArguments {
  final File file;
  final String? sheetName;

  DocumentArguments({required this.file, this.sheetName});
}