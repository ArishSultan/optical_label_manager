// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OutputTypeAdapter extends TypeAdapter<OutputType> {
  @override
  final int typeId = 2;

  @override
  OutputType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return OutputType.url;
      case 2:
        return OutputType.text;
      case 3:
        return OutputType.contact;
      case 4:
        return OutputType.email;
      case 5:
        return OutputType.sms;
      case 6:
        return OutputType.geo;
      case 7:
        return OutputType.phone;
      case 8:
        return OutputType.calendar;
      case 9:
        return OutputType.wifi;
      case 10:
        return OutputType.vCard;
      case 11:
        return OutputType.ean_8;
      case 12:
        return OutputType.ean_13;
      case 13:
        return OutputType.upc_a;
      case 14:
        return OutputType.upc_e;
      case 15:
        return OutputType.itf;
      case 16:
        return OutputType.code_39;
      case 17:
        return OutputType.code_93;
      case 18:
        return OutputType.code_128;
      case 19:
        return OutputType.codabar;
      case 20:
        return OutputType.maxi_code;
      case 21:
        return OutputType.rss_14;
      case 22:
        return OutputType.rss_expanded;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, OutputType obj) {
    switch (obj) {
      case OutputType.url:
        writer.writeByte(1);
        break;
      case OutputType.text:
        writer.writeByte(2);
        break;
      case OutputType.contact:
        writer.writeByte(3);
        break;
      case OutputType.email:
        writer.writeByte(4);
        break;
      case OutputType.sms:
        writer.writeByte(5);
        break;
      case OutputType.geo:
        writer.writeByte(6);
        break;
      case OutputType.phone:
        writer.writeByte(7);
        break;
      case OutputType.calendar:
        writer.writeByte(8);
        break;
      case OutputType.wifi:
        writer.writeByte(9);
        break;
      case OutputType.vCard:
        writer.writeByte(10);
        break;
      case OutputType.ean_8:
        writer.writeByte(11);
        break;
      case OutputType.ean_13:
        writer.writeByte(12);
        break;
      case OutputType.upc_a:
        writer.writeByte(13);
        break;
      case OutputType.upc_e:
        writer.writeByte(14);
        break;
      case OutputType.itf:
        writer.writeByte(15);
        break;
      case OutputType.code_39:
        writer.writeByte(16);
        break;
      case OutputType.code_93:
        writer.writeByte(17);
        break;
      case OutputType.code_128:
        writer.writeByte(18);
        break;
      case OutputType.codabar:
        writer.writeByte(19);
        break;
      case OutputType.maxi_code:
        writer.writeByte(20);
        break;
      case OutputType.rss_14:
        writer.writeByte(21);
        break;
      case OutputType.rss_expanded:
        writer.writeByte(22);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OutputTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OutputAdapter extends TypeAdapter<Output> {
  @override
  final int typeId = 1;

  @override
  Output read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Output(
      isFavorite: fields[2] as bool,
      type: fields[3] as OutputType,
      name: fields[0] as String,
      data: fields[1] as String,
      timestamp: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Output obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.isFavorite)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OutputAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
