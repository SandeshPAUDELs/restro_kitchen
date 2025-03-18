// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientModelsAdapter extends TypeAdapter<IngredientModels> {
  @override
  final int typeId = 0;

  @override
  IngredientModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientModels(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientModels obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
