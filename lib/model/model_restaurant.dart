class ModelRestaurant {
  List<RestaurantElement>? restaurants;

  ModelRestaurant({
    this.restaurants,
  });

  factory ModelRestaurant.fromJson(Map<String, dynamic> json) =>
      ModelRestaurant(restaurants: json['restaurants']);
}

class RestaurantElement {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  RestaurantElement({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });
}

class Menus {
  List<Drink>? foods;
  List<Drink>? drinks;

  Menus({
    this.foods,
    this.drinks,
  });
}

class Drink {
  String? name;

  Drink({this.name});
}
