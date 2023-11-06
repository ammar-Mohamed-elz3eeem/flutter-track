import 'dart:convert';
import 'dart:io';

class FileDB {
  final String filename;
  static String id = DateTime.now().microsecondsSinceEpoch.toString();
  List _objects = [];

  FileDB(this.filename);

  List get objects => _objects;

  Future<void> _readFile() async {
    final File fd = File(filename);
    try {
      await fd.exists();
      String content = await fd.readAsString();
      _objects = jsonDecode(content);
      print(_objects);
    } catch (e) {
      print(e);
    }
  }

  void _writeToFile() {
    final File fd = File(filename);
    if (!fd.existsSync()) {
      throw AssertionError("$filename not found");
    }
    fd.writeAsStringSync(jsonEncode(_objects));
  }

  bool save() {
    _writeToFile();
    return true;
  }

  bool delete(String id) {
    _objects.removeWhere((element) => element.id == id);
    save();
    return true;
  }

  List show(String id) {
    return _objects.where((element) => element.id == id).toList();
  }

  bool update(String id, Map updates) {
    updates.forEach((key, value) {
      _objects[_objects.indexWhere((element) => element.id == id)]
          .toMap()[key] = value;
    });
    save();
    return true;
  }

  bool add(Map data) {
    _objects.add(data);
    save();
    return true;
  }

  List read() {
    return _objects;
  }

  void reload() {
    _readFile();
  }
}
