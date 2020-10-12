import 'package:hive/hive.dart';
import 'package:optical_label_manager/src/data/models/person-contact_model.dart';

mixin ContactMixin {
  static Box<PersonContact> _box;
  static Future<void> initiate() async {
    _box = await Hive.openBox<PersonContact>('temp-contact');
  }

  bool isContactSaved() => _box.isNotEmpty;

  PersonContact readContact() {
    return _box.getAt(0);
  }

  Future<void> saveContact(PersonContact contact) {
    _box.add(contact);
    return contact.save();
  }
}