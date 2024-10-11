class CategoryModel {
  final int id;
  final String name;
  final String image;

  const CategoryModel(
    this.id,
    this.name,
    this.image,
  );
}

List<CategoryModel> categoryList = [
  CategoryModel(1, "Pet", "assets/images/cat1.jpg"),
  CategoryModel(2, "Tools", "assets/images/cat2.jpg"),
  CategoryModel(3, "Groceries", "assets/images/cat3.jpg"),
  CategoryModel(4, "Computers", "assets/images/cat4.jpg"),
];
