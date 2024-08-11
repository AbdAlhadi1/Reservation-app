

import 'Hotel Details.dart';

class CarObject {
  late int carId,carCompanyId,carCapacity;
  late String carName,carNumber,carType,price,carDescription;
  late bool containBabeSeat;
  late List <HotelImage> carImages;
  CarObject({
   required this.carId,
   required this.carCompanyId,
   required this.carName,
   required this.carNumber,
   required this.carType,
   required this.price,
   required this.carDescription,
   required this.carCapacity,
   required this.containBabeSeat,
   required this.carImages,
});
}