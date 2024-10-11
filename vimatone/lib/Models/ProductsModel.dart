class ProductsModel {
  final int ad_id;
  final int vendor_id;
  final String title;
  final String tags;
  final int stock;
  final String post_author;
  final String? description;
  final String? purchase_note;
  final String category;
  final double? sale_price;
  final double? regular_price;
  final String? thumbnail_id;
  final String? payment_ref;
  final String ad_type; //this is an enum
  final String ad_status;
  final String post_date;
  final String? expiry_date;
  final bool is_approved;
  final String is_trending;
  int quantity = 1;

  ProductsModel(
    this.ad_id,
    this.vendor_id,
    this.title,
    this.tags,
    this.stock,
    this.post_author,
    this.description,
    this.purchase_note,
    this.category,
    this.sale_price,
    this.regular_price,
    this.thumbnail_id,
    this.payment_ref,
    this.ad_type,
    this.ad_status,
    this.post_date,
    this.expiry_date,
    this.is_approved,
    this.is_trending,
  );

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        json["ad_id"],
        json["vendor_id"],
        json["title"],
        json["tags"],
        json["stock"],
        json["post_author"],
        json["description"],
        json["purchase_note"],
        json["category"],
        json["sale_price"],
        json["regular_price"],
        json["thumbnail_id"],
        json["payment_ref"],
        json["ad_type"],
        json["ad_status"],
        json["post_date"],
        json["expiry_date"],
        json["is_approved"],
        json["is_trending"],
      );
}

List<ProductsModel> ProductList = [
  ProductsModel(
    1,
    20,
    "Dell Inspiron Gen-11 i5",
    "tags",
    20,
    "post_author",
    "Dell Inspiron Gen-11 i5 with 64gb ram and 5tb ssd. keyboard lights, softkeyboard, strong battery. Good camera with usbC port. ",
    "purchase_note",
    "Computers",
    1829.99,
    2005.85,
    "assets/images/lap1.jpg",
    "payment_ref",
    "ad_type",
    "ad_status",
    "post_date",
    "expiry_date",
    true,
    "is_trending",
  ),
  ProductsModel(
    1,
    20,
    "Alienware i9 laptop 32 core, 128 gb ram",
    "tags",
    20,
    "post_author",
    "Alienware i9 laptop 32 core, 128 gb ram, 8tb ssd, keyboard lights, camera, strong battery rgb colors. usitable for gaming, editing, etc...",
    "purchase_note",
    "Computers",
    2500.10,
    3054.85,
    "assets/images/lap2.jpg",
    "payment_ref",
    "ad_type",
    "ad_status",
    "post_date",
    "expiry_date",
    true,
    "is_trending",
  ),
  ProductsModel(
    1,
    20,
    "Gaming rgb backlit mouse",
    "tags",
    20,
    "post_author",
    "Sony T53ef rgb gaming mouse, 3 gear dpi change, backlit, very smooth",
    "purchase_note",
    "Pet",
    42.99,
    65.85,
    "assets/images/mouse.jpg",
    "payment_ref",
    "ad_type",
    "ad_status",
    "post_date",
    "expiry_date",
    true,
    "is_trending",
  ),
  ProductsModel(
    1,
    20,
    "Iphone 16 pro max",
    "tags",
    20,
    "post_author",
    "Iphone 16 pro max ultra super, 100gb ram 2000gb rom a lot os features but paid and a lot of security blocks.",
    "purchase_note",
    "Tools",
    589.99,
    700.85,
    "assets/images/iphone.jpg",
    "payment_ref",
    "ad_type",
    "ad_status",
    "post_date",
    "expiry_date",
    true,
    "is_trending",
  ),
  ProductsModel(
    1,
    20,
    "Iphone 16 pro max",
    "tags",
    20,
    "post_author",
    "Iphone 16 pro max ultra super, 100gb ram 2000gb rom a lot os features but paid and a lot of security blocks.",
    "purchase_note",
    "Groceries",
    589.99,
    700.85,
    "assets/images/iphone.jpg",
    "payment_ref",
    "ad_type",
    "ad_status",
    "post_date",
    "expiry_date",
    true,
    "is_trending",
  ),
];
