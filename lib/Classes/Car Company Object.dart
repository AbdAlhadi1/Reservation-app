

import 'package:reservationapp/Classes/One%20Car%20Company.dart';

class CarCompanyObject {

  late int count ;
  late String nextUrl,previousUrl;
  late List <OneCarCompany> carCompany;

  CarCompanyObject({
    required this.count,
    required this.nextUrl,
    required this.previousUrl,
    required this.carCompany,
  });
}