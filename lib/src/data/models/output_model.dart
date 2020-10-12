import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'output_model.g.dart';

@HiveType(typeId: 2)
enum OutputType {
  @HiveField(1)
  url,
  @HiveField(2)
  text,
  @HiveField(3)
  contact,
  @HiveField(4)
  email,
  @HiveField(5)
  sms,
  @HiveField(6)
  geo,
  @HiveField(7)
  phone,
  @HiveField(8)
  calendar,
  @HiveField(9)
  wifi,
  @HiveField(10)
  vCard,

  /// BarCode Types
  @HiveField(11)
  ean_8,
  @HiveField(12)
  ean_13,
  @HiveField(13)
  upc_a,
  @HiveField(14)
  upc_e,
  @HiveField(15)
  itf,
  @HiveField(16)
  code_39,
  @HiveField(17)
  code_93,
  @HiveField(18)
  code_128,
  @HiveField(19)
  codabar,
  @HiveField(20)
  maxi_code,
  @HiveField(21)
  rss_14,
  @HiveField(22)
  rss_expanded,

  /// QrCodes Types
  pdf_417,
  data_matrix,
  aztec
}

@HiveType(typeId: 1)
class Output extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String data;
  @HiveField(2)
  bool isFavorite;
  @HiveField(3)
  OutputType type;
  @HiveField(4)
  DateTime timestamp;

  Output({
    this.isFavorite = false,
    @required this.type,
    @required this.name,
    @required this.data,
    @required this.timestamp,
  });

  Future<void> toggleFavorite() async {
    isFavorite = !isFavorite;
    await save();
  }
}
