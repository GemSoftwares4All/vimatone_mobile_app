class CategoryModel {
  final int id;
  final String name;
  final String image;

  const CategoryModel(
    this.id,
    this.name,
    this.image,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        int.parse(json["category_id"]),
        json["name"],
        json["image"],
      );
}
