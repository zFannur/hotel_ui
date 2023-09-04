class Booking {
  Booking({
    required this.id,
    required this.hotelName,
    required this.hotelAdress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });
  late final int id;
  late final String hotelName;
  late final String hotelAdress;
  late final int horating;
  late final String ratingName;
  late final String departure;
  late final String arrivalCountry;
  late final String tourDateStart;
  late final String tourDateStop;
  late final int numberOfNights;
  late final String room;
  late final String nutrition;
  late final int tourPrice;
  late final int fuelCharge;
  late final int serviceCharge;

  Booking.fromJson(Map<String, dynamic> json){
    id = json['id'];
    hotelName = json['hotel_name'];
    hotelAdress = json['hotel_adress'];
    horating = json['horating'];
    ratingName = json['rating_name'];
    departure = json['departure'];
    arrivalCountry = json['arrival_country'];
    tourDateStart = json['tour_date_start'];
    tourDateStop = json['tour_date_stop'];
    numberOfNights = json['number_of_nights'];
    room = json['room'];
    nutrition = json['nutrition'];
    tourPrice = json['tour_price'];
    fuelCharge = json['fuel_charge'];
    serviceCharge = json['service_charge'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['hotel_name'] = hotelName;
    data['hotel_adress'] = hotelAdress;
    data['horating'] = horating;
    data['rating_name'] = ratingName;
    data['departure'] = departure;
    data['arrival_country'] = arrivalCountry;
    data['tour_date_start'] = tourDateStart;
    data['tour_date_stop'] = tourDateStop;
    data['number_of_nights'] = numberOfNights;
    data['room'] = room;
    data['nutrition'] = nutrition;
    data['tour_price'] = tourPrice;
    data['fuel_charge'] = fuelCharge;
    data['service_charge'] = serviceCharge;
    return data;
  }
}