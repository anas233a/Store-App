class prMod {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  prMod.ds();
  prMod(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory prMod.get(data) {
    return prMod(
        id: data['id'],
        title: data['title'],
        price: data['price'],
        description: data['description'],
        category: data['category'],
        image: data['image'],
        rating: Rating.get(data['rating']) == null
            ? null
            : Rating.get(data['rating']));
  }
  //   prMod.put(data){
  //   id = data['id'];
  //   title = data['title'];
  //   price = data['price'];
  //   description = data['description'];
  //   category = data['category'];
  //   image = data['image'];
  // }
}

class Rating {
  double? rate;
  double? count;
  Rating({required this.count, required this.rate});
  Rating.get(data) {
    rate = data['rate'];
    count = data['count'];
  }
}
