class Product {
  String? id;
  String name;
  double price;
  String location;
  String imageUrl;
  int quant;

  Product(this.name, this.price, this.location, this.imageUrl, this.quant);

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        location = json['location'],
        imageUrl = json['imageUrl'],
        quant = json['quant'];

  // productA.toJson()
  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'location': location,
    'imageUrl': imageUrl,
    'quant': quant
  };

  static List<Product> listFromJson(Map<String, dynamic> json) {
    List<Product> products = [];
    json.forEach((key, value) { 
      Map<String, dynamic> item = { "id": key, ...value };
      products.add(Product.fromJson(item));
    });
    return products;
  }
}
