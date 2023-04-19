import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<File> writeFile({
    required List<int> fileContent,
    required String fileName,
    String? dir,
  }) async {
    var directory = dir ?? (await getApplicationDocumentsDirectory()).path;
    var newFile = File('$directory/$fileName');
    if (newFile.existsSync()) {
      await newFile.delete();
    }
    newFile = await newFile.create(recursive: true);
    newFile = await newFile.writeAsBytes(fileContent);

    return newFile;
  }
}
