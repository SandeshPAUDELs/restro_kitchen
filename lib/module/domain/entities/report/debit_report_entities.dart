class DebitReportEntities {
  final String foodName;
  final int servingQuantity;
  DebitReportEntities({
    required this.foodName,
    required this.servingQuantity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DebitReportEntities &&
        other.foodName == foodName &&
        other.servingQuantity == servingQuantity;
  }

  @override
  int get hashCode {
    return foodName.hashCode ^ servingQuantity.hashCode;
  }
}