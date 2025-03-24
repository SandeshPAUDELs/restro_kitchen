// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_report_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebitReportModelsAdapter extends TypeAdapter<DebitReportModels> {
  @override
  final int typeId = 6;

  @override
  DebitReportModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebitReportModels(
      foodName: fields[0] as String,
      servingQuantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DebitReportModels obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.servingQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebitReportModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
