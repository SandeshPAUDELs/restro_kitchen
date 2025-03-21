// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intermediate_item_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IntermediateItemsModelsAdapter
    extends TypeAdapter<IntermediateItemsModels> {
  @override
  final int typeId = 2;

  @override
  IntermediateItemsModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntermediateItemsModels(
      intermediateItemName: fields[0] as String,
      ingredientsItemModels: fields[1] as int,
      availableQuantity: fields[2] as int,
      requiredQuantity: fields[3] as int,
      servingQuantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, IntermediateItemsModels obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.intermediateItemName)
      ..writeByte(1)
      ..write(obj.ingredientsItemModels)
      ..writeByte(2)
      ..write(obj.availableQuantity)
      ..writeByte(3)
      ..write(obj.requiredQuantity)
      ..writeByte(4)
      ..write(obj.servingQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntermediateItemsModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
