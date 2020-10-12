import 'package:optical_label_manager/src/data/models/output_model.dart';

class QRType {
  static OutputType getType(String data) {
    if (data.startsWith('http')) {
      return OutputType.url;
    } else if (data.startsWith('MATMSG') ||
        data.startsWith('matmsg') ||
        data.startsWith('mailto')) {
      return OutputType.email;
    } else if (data.startsWith('TEL') || data.startsWith('tel')) {
      return OutputType.phone;
    } else if (data.startsWith('SMSTO') || data.startsWith('smsto')) {
      return OutputType.sms;
    } else if (data.startsWith('MECARD') ||
        data.startsWith('BEGIN:VCARD') ||
        data.startsWith('mecard') ||
        data.startsWith('begin:vcard')) {
      return OutputType.vCard;
    } else if (data.startsWith('BEGIN:VCALENDAR')) {
      return OutputType.calendar;
    } else if (data.startsWith('geo')) {
      return OutputType.geo;
    } else if (data.startsWith('WIFI')) {
      return OutputType.wifi;
    } else
      return OutputType.text;
  }

  static String getName(OutputType outputType) {
    switch (outputType) {
      case OutputType.url:
        return 'Url';
      case OutputType.text:
        return 'Text';
      case OutputType.contact:
        return 'Contact';
      case OutputType.email:
        return 'Email';
      case OutputType.sms:
        return 'SMS';
      case OutputType.geo:
        return 'Geo';
      case OutputType.phone:
        return 'Phone';
      case OutputType.calendar:
        return 'Calendar';
      case OutputType.wifi:
        return 'Wifi';
      default:
        return '';
    }
  }
}
