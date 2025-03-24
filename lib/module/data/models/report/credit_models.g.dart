// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditModelsAdapter extends TypeAdapter<CreditModels> {
  @override
  final int typeId = 5;

  @override
  CreditModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditModels(
      ingredient: fields[0] as String,
      price: fields[1] as double,
      materialUnit: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CreditModels obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ingredient)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.materialUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
