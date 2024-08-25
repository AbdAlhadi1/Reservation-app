
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:reservationapp/Classes/Car%20Company%20Object.dart';
import 'package:reservationapp/Classes/Car%20Object.dart';
import 'package:reservationapp/Classes/Hotel%20Details.dart';
import 'package:reservationapp/Classes/One%20Car%20Company.dart';
import 'package:reservationapp/Server/host.dart';
import 'package:tuple/tuple.dart';

import '../../Classes/Cities.dart';
import '../../Classes/One city.dart';

class CarServiceApi{



  Future showCarCompany () async {

    try {Response response = await get(
          Uri.parse(CarUrls.carServiceBaseUrl + CarUrls.showCarCompany));
      if (response.statusCode == 200) {
        print(response.statusCode);
        var info = jsonDecode(response.body);
        List<OneCarCompany> op = [];
        print(info["results"].length);
        for (int i = 0; i < info["results"].length; i++) {
          OneCarCompany oneCarCompany = OneCarCompany(
              carCompanyId: info["results"][i]["id"],
              cityId: info["results"][i]["city"],
              carCompanyMainPhoto: info["results"][i]["main_image"],
              carCompanyName: info["results"][i]["name"],
              carCompanyEmail: info["results"][i]["email"],
              carCompanyPhone: info["results"][i]["phone"],
              carCompanyCountry: info["results"][i]["country"],
              carCompanyCity: "",
              carCompanyDate: info["results"][i]["date_created"],
              numberOfRates: info["results"][i]["number_of_rates"],
              sumOfRates: info["results"][i]["sum_of_rates"]);
          op.add(oneCarCompany);
        }
        CarCompanyObject carCompanyObject = CarCompanyObject(
            count: info["count"],
            nextUrl: info["next"] ?? "",
            previousUrl: info["previous"] ?? "",
            carCompany: op);
        for (int i = 0; i < carCompanyObject.carCompany.length; i++) {
          print(carCompanyObject.nextUrl);
          print(carCompanyObject.previousUrl);
          print(carCompanyObject.count);
          print(carCompanyObject.carCompany[i].cityId);
          print(carCompanyObject.carCompany[i].carCompanyId);
          print(carCompanyObject.carCompany[i].sumOfRates);
          print(carCompanyObject.carCompany[i].numberOfRates);
          print(carCompanyObject.carCompany[i].carCompanyDate);
          print(carCompanyObject.carCompany[i].carCompanyCity);
          print(carCompanyObject.carCompany[i].carCompanyCountry);
          print(carCompanyObject.carCompany[i].carCompanyPhone);
          print(carCompanyObject.carCompany[i].carCompanyEmail);
          print(carCompanyObject.carCompany[i].carCompanyName);
          print(carCompanyObject.carCompany[i].carCompanyMainPhoto);
        }
        return Tuple2(true, carCompanyObject);
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(false, jsonDecode(response.body).toString());
      }
    }catch(e){
      return Tuple2(false, e.toString());
    }
  }



  Future showCars (int carCompanyId) async {
    try {

      Response response = await get(Uri.parse("${CarUrls.carServiceBaseUrl}${CarUrls.showCars}$carCompanyId"));
      if(response.statusCode == 200){
        print(response.statusCode);
        var info = jsonDecode(response.body);
        print(info);
        List<CarObject> carObjects = [];
        for(int i=0;i<info.length;i++){
          print("op");
          List<HotelImage> carImages = [];
          for(int j= 0;j<info[i]["images"].length;j++){
            print("os");
            print(info[i]["images"]);
            HotelImage carImage = HotelImage(relatedObjectToThisImageId: info[i]["images"][j]["car"], imageId: info[i]["images"][j]["id"], image: info[i]["images"][j]["image"]);
            carImages.add(carImage);
          }
          CarObject carObject = CarObject(
              carId: info[i]["id"],
              carCompanyId: carCompanyId,
              carName: info[i]["name"],
              carNumber: info[i]["number"],
              carType: info[i]["car_type"],
              price: info[i]["price"],
              carDescription: info[i]["description"],
              carCapacity: info[i]["number_of_people_can_contain"],
              containBabeSeat: info[i]["contain_baby_seat"],
              carImages: carImages
          );
          carObjects.add(carObject);
        }
        return Tuple2(true, carObjects);
      } else {
        print(response.statusCode);
        return Tuple2(false, jsonDecode(response.body).toString());
      }
    } catch(e) {
      return Tuple2(false, e.toString());
    }
  }


  Future searchCarCompany (TextEditingController word) async {
    try{
      Response response = await get(Uri.parse("${CarUrls.carServiceBaseUrl}${CarUrls.searchForCar}$word"));
      if (response.statusCode == 200) {
        print(response.statusCode);
        var info = jsonDecode(response.body);
        List<OneCarCompany> op = [];
        print(info["results"].length);
        for (int i = 0; i < info["results"].length; i++) {
          OneCarCompany oneCarCompany = OneCarCompany(
              carCompanyId: info["results"][i]["id"],
              cityId: info["results"][i]["city"],
              carCompanyMainPhoto: info["results"][i]["main_image"],
              carCompanyName: info["results"][i]["name"],
              carCompanyEmail: info["results"][i]["email"],
              carCompanyPhone: info["results"][i]["phone"],
              carCompanyCountry: info["results"][i]["country"],
              carCompanyCity: "",
              carCompanyDate: info["results"][i]["date_created"],
              numberOfRates: info["results"][i]["number_of_rates"],
              sumOfRates: info["results"][i]["sum_of_rates"]);
          op.add(oneCarCompany);
        }
        CarCompanyObject carCompanyObject = CarCompanyObject(
            count: info["count"],
            nextUrl: info["next"] ?? "",
            previousUrl: info["previous"] ?? "",
            carCompany: op);
        for (int i = 0; i < carCompanyObject.carCompany.length; i++) {
          print(carCompanyObject.nextUrl);
          print(carCompanyObject.previousUrl);
          print(carCompanyObject.count);
          print(carCompanyObject.carCompany[i].cityId);
          print(carCompanyObject.carCompany[i].carCompanyId);
          print(carCompanyObject.carCompany[i].sumOfRates);
          print(carCompanyObject.carCompany[i].numberOfRates);
          print(carCompanyObject.carCompany[i].carCompanyDate);
          print(carCompanyObject.carCompany[i].carCompanyCity);
          print(carCompanyObject.carCompany[i].carCompanyCountry);
          print(carCompanyObject.carCompany[i].carCompanyPhone);
          print(carCompanyObject.carCompany[i].carCompanyEmail);
          print(carCompanyObject.carCompany[i].carCompanyName);
          print(carCompanyObject.carCompany[i].carCompanyMainPhoto);
        }
        return Tuple2(true, carCompanyObject);
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(false, jsonDecode(response.body).toString());
      }
    }catch(e){
      return Tuple2(false, e.toString());
    }
  }

  Future getCities () async {

    try {
      Response response = await get(Uri.parse(CarUrls.carServiceBaseUrl+CarUrls.getCities));
      if(response.statusCode == 200) {
        print(response.statusCode);

        var info = jsonDecode(response.body);
        List citiesList = info["results"];
        print(citiesList);
        List <OneCity> citiesArray = [];
        for (int i = 0; i < citiesList.length; i++) {
          OneCity oneCity = OneCity(
              id: info["results"][i]["id"],
              cityName: info["results"][i]["name"],
              cityImage: info["results"][i]["image"]
          );
          citiesArray.add(oneCity);
        }
        Cities cities = Cities(count: info["count"] , nextUrl: info["next"] ?? "", previousUrl: info["previous"] ?? "", citiesArray: citiesArray);
        print("done");
        return Tuple2(true,cities);
      }
      else {
        print(response.statusCode);
        return Tuple2(false, jsonDecode(response.body).toString());
      }
    }catch(e){
      Tuple2(false, e.toString());
    }


  }
  Future bookCar(int carId,int carCompanyId,String username,TextEditingController startDate,TextEditingController endDate,TextEditingController picLocation,TextEditingController delLocation) async {
    try {
      print(carId.runtimeType);
      print(carCompanyId.runtimeType);
      //print(userId.runtimeType);
      print(startDate.text.runtimeType);
      print(endDate.text.runtimeType);
      print(picLocation.text.runtimeType);
      print(delLocation.text.runtimeType);
      print(CarUrls.carServiceBaseUrl.runtimeType);
      print(CarUrls.bookCar.runtimeType);
      final body =jsonEncode({
        "car_company_id":carCompanyId,
        "car_id":carId,
        "username":username,
        "start_date" : startDate.text,
        "end_date" : endDate.text,
        "pickup_location": picLocation.text,
        "delivery_location":delLocation.text,
        "description" : "  ",
        "is_car_reservation" : true,
        "is_hotel_reservation" : false,
      });
      Response response = await post(Uri.parse(CarUrls.carServiceBaseUrl+CarUrls.bookCar),body: body,headers: {
        'Content-Type': 'application/json'
      });
      print("object");
      if(response.statusCode == 200){
        print (response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(true, jsonDecode(response.body));
      } else {
        print(response.statusCode);
        return Tuple2(false, jsonDecode(response.body).toString());
      }
    }catch(e){
      print("llll");
      print(e);
      print("---------------");
      return Tuple2(false, e.toString());
    }
  }

}


