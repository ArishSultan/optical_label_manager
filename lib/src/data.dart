import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:optical_label_manager/src/data/mixins/contact_mixin.dart';
import 'package:optical_label_manager/src/data/mixins/output_mixin.dart';
import 'package:optical_label_manager/src/data/models/person-contact_model.dart';

import 'data/models/output_model.dart';

class AppData with ContactMixin, OutputMixin {
  static AppData _instance;

  static Future<void> initiate() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonContactAdapter());
    Hive.registerAdapter(OutputTypeAdapter());
    Hive.registerAdapter(OutputAdapter());

    await ContactMixin.initiate();
    await OutputMixin.initiate();

    /// Finally create the Instance.
    _instance = _AppData();
  }

  AppData._();

  factory AppData() {
    if (_instance != null) {
      return _AppData();
    }

    throw '[AppData] not initialized';
  }
}

class _AppData extends AppData {
  _AppData() : super._();
}
