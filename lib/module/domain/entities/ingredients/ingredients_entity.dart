class IngredientsEntity {
  final String name;
  const IngredientsEntity({required this.name});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IngredientsEntity && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
