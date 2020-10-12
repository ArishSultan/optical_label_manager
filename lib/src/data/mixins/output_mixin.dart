import 'package:hive/hive.dart';
import 'package:optical_label_manager/src/data/models/output_model.dart';

mixin OutputMixin {
  static Box<Output> _box;

  static Future<void> initiate() async {
    _box = await Hive.openBox<Output>('');
  }

  bool isOutputSaved() => _box.isNotEmpty;

  Output readOutput(int index) {
    return _box.getAt(index);
  }

  deleteOutput(int key) {
    _box.delete(key);
  }
  List<Output> getFavoriteOutputs() {
    return _box.values.where((element) => element.isFavorite).toList();
  }

  List<Output> getOutputs() {
    return _box.values.toList();
  }

  Future<void> saveOutput(Output output) {
    _box.add(output);
    return output.save();
  }
}
