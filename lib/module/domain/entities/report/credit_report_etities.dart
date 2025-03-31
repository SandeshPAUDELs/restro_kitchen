class CreditEntities {
  final String ingredient;
  final double price;
  final double materialUnit;

  CreditEntities({
    required this.ingredient,
    required this.price,
    required this.materialUnit,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditEntities &&
        other.ingredient == ingredient &&
        other.price == price &&
        other.materialUnit == materialUnit;
  }
  @override
  int get hashCode {
    return ingredient.hashCode ^ price.hashCode ^ materialUnit.hashCode;
  }
}
