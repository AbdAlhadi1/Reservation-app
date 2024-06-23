

import 'package:reservationapp/Classes/Hotel.dart';

class HotelObject {

  late int count;
  late String nextUrl,previousUrl;
  late List<OneHotel> oneHotel;

  HotelObject({
    required this.count,
    required this.nextUrl,
    required this.previousUrl,
    required this.oneHotel,
  });
}