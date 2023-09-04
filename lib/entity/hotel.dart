class Hotel {
  Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });
  late final int id;
  late final String name;
  late final String adress;
  late final int minimalPrice;
  late final String priceForIt;
  late final String rating;
  late final String ratingName;
  late final List<String> imageUrls;
  late final AboutTheHotel aboutTheHotel;

  Hotel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    adress = json['adress'];
    minimalPrice = json['minimal_price'];
    priceForIt = json['price_for_it'];
    rating = json['rating'].toString();
    ratingName = json['rating_name'];
    imageUrls = List.castFrom<dynamic, String>(json['image_urls']);
    aboutTheHotel = AboutTheHotel.fromJson(json['about_the_hotel']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['adress'] = adress;
    data['minimal_price'] = minimalPrice;
    data['price_for_it'] = priceForIt;
    data['rating'] = rating;
    data['rating_name'] = ratingName;
    data['image_urls'] = imageUrls;
    data['about_the_hotel'] = aboutTheHotel.toJson();
    return data;
  }
}

class AboutTheHotel {
  AboutTheHotel({
    required this.description,
    required this.peculiarities,
  });
  late final String description;
  late final List<String> peculiarities;

  AboutTheHotel.fromJson(Map<String, dynamic> json){
    description = json['description'];
    peculiarities = List.castFrom<dynamic, String>(json['peculiarities']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['peculiarities'] = peculiarities;
    return data;
  }
}