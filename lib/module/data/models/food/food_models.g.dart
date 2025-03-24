// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodModelsAdapter extends TypeAdapter<FoodModels> {
  @override
  final int typeId = 3;

  @override
  FoodModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodModels(
      foodName: fields[0] as String,
      intermediateItemsModels: fields[1] as int,
      otherRequiredFoodModels:
          (fields[2] as List).cast<OtherRequiredFoodModels>(),
    );
  }

  @override
  void write(BinaryWriter writer, FoodModels obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.intermediateItemsModels)
      ..writeByte(2)
      ..write(obj.otherRequiredFoodModels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OtherRequiredFoodModelsAdapter
    extends TypeAdapter<OtherRequiredFoodModels> {
  @override
  final int typeId = 4;

  @override
  OtherRequiredFoodModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OtherRequiredFoodModels(
      itemName: fields[0] as String,
      quantity: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OtherRequiredFoodModels obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherRequiredFoodModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
