// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityAdapter extends TypeAdapter<_$_Activity> {
  @override
  final int typeId = 1;

  @override
  _$_Activity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Activity(
      activityName: fields[0] as String,
      iconCode: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Activity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.activityName)
      ..writeByte(1)
      ..write(obj.iconCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ActivityAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
