// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodRecordAdapter extends TypeAdapter<_$_MoodRecord> {
  @override
  final int typeId = 0;

  @override
  _$_MoodRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MoodRecord(
      label: fields[0] as String,
      score: fields[1] as int,
      iconPath: fields[2] as String,
      color: fields[3] as int,
      date: fields[4] as DateTime,
      note: fields[5] as String?,
      activities: (fields[6] as List).cast<Activity>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_MoodRecord obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.iconPath)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.note)
      ..writeByte(6)
      ..write(obj.activities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
