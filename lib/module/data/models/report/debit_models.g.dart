// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebitModelsAdapter extends TypeAdapter<DebitModels> {
  @override
  final int typeId = 6;

  @override
  DebitModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebitModels(
      foodName: fields[0] as String,
      servingQuantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DebitModels obj) {
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
      other is DebitModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
