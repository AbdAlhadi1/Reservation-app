

import 'package:reservationapp/Classes/Hotel.dart';

class HotelDetails {
  late OneHotel oneHotel;
  late List<HotelComments> hotelComments;
  late HotelFeatures hotelFeatures;
  late HotelImage hotelImage;
  late HotelStays hotelStays;
  HotelDetails({
    required this.oneHotel,
    required this.hotelComments,
    required this.hotelFeatures,
    required this.hotelImage,
    required this.hotelStays


  });
}




class HotelComments{
  late int commentId,hotelId,userId;
  late String comment;
  HotelComments({
    required this.commentId,
    required this.hotelId,
    required this.userId,
    required this.comment,
});
}

class HotelFeatures{
  late int featureId,hotelId;
  late String name,icon;

  HotelFeatures({
    required this.featureId,
    required this.hotelId,
    required this.name,
    required this.icon
});
}


class HotelImage{
  late int relatedObjectToThisImageId,imageId;
  late String image;

  HotelImage({
    required this.relatedObjectToThisImageId,
    required this.imageId,
    required this.image,
});
}

class HotelStays{
  late int hotelId,stayId;
  late String stayType,price,description;
  late List<HotelImage> staysImage;
  HotelStays({
    required this.hotelId,
    required this.stayId,
    required this.description,
    required this.price,
    required this.staysImage,
    required this.stayType
});
}