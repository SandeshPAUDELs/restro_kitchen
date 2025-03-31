class IntermediateItemsEntity {
  String intermediateItemName;
  int ingredientsItemModels;
  int availableQuantity;
  int requiredQuantity;
  int servingQuantity;

  IntermediateItemsEntity({
    required this.intermediateItemName,
    required this.ingredientsItemModels,
    required this.availableQuantity,
    required this.requiredQuantity,
    required this.servingQuantity,
  });    

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IntermediateItemsEntity &&
        other.intermediateItemName == intermediateItemName &&
        other.ingredientsItemModels == ingredientsItemModels &&
        other.availableQuantity == availableQuantity &&
        other.requiredQuantity == requiredQuantity &&
        other.servingQuantity == servingQuantity;
  }

  @override
  int get hashCode {
    return intermediateItemName.hashCode ^
        ingredientsItemModels.hashCode ^
        availableQuantity.hashCode ^
        requiredQuantity.hashCode ^
        servingQuantity.hashCode;
  }
} 