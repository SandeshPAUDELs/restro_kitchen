// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_item_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientsItemModelsAdapter extends TypeAdapter<IngredientsItemModels> {
  @override
  final int typeId = 1;

  @override
  IngredientsItemModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientsItemModels(
      ingredientname: fields[0] as String,
      ingredientModels: fields[1] as int,
      price: fields[2] as double,
      materialsUnit: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientsItemModels obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ingredientname)
      ..writeByte(1)
      ..write(obj.ingredientModels)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.materialsUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsItemModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
