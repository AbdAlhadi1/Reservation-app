

import 'dart:convert';

import 'package:http/http.dart';
import 'package:reservationapp/Classes/Hotel%20Details.dart';
import 'package:reservationapp/Classes/Hotel%20Object.dart';
import 'package:reservationapp/Classes/Hotel.dart';
import 'package:tuple/tuple.dart';

import '../../Classes/Cities.dart';
import '../../Classes/One city.dart';
import '../../Server/host.dart';

class HotelServiceApi{

  Future getCities()async{
    try{

      Response response = await get(Uri.parse(HotelsUrls.hotelServiceBaseUrl+HotelsUrls.getCities));
      if(response.statusCode == 200) {
        print(response.statusCode);

        var info = jsonDecode(response.body);
        List citiesList = info["results"];
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
        return Tuple2(true,[cities]);
      }
      else {
        var error = [];
        error.add(utf8.decode(response.bodyBytes));
        return Tuple2(false, error);
      }
    }catch(e){
      return Tuple2(false, [e.toString()]);
    }


  }



  Future<Tuple2<bool,List>> searchForHotel(String word) async{
    try{
      Response response = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.searchForHotelUrl}$word"));
      if(response.statusCode == 200){
        print(response.statusCode);
        var info = jsonDecode(response.body);
        List<OneHotel> op = [];
        for(int i=0;i<info["results"].length; i++){
          OneHotel oneHotel = OneHotel(
              hotelId: info["results"][i]["id"],
              cityId: info["results"][i]["city"],
              hotelMainPhoto: info["results"][i]["main_image"],
              hotelName: info["results"][i]["name"],
              hotelEmail: info["results"][i]["email"],
              hotelPhone: info["results"][i]["phone"],
              hotelCountry: info["results"][i]["country"],
              hotelCity: "",
              creationDate: info["results"][i]["date_created"],
              numberOfRates: info["results"][i]["number_of_rates"],
              sumOfRates: info["results"][i]["sum_of_rates"]);
          op.add(oneHotel);

        }

        HotelObject hotelObject = HotelObject(count: info["count"], nextUrl: info["next"], previousUrl: info["previous"], oneHotel: op);
        return Tuple2(true, [hotelObject]);
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(false, [jsonDecode(response.body).toString()]);
      }

    }catch(e){
      print("this is the error $e");
      return Tuple2(false, [e.toString()]);
    }
  }
  
  Future showHotels() async {
    try{
      Response response = await get(Uri.parse(HotelsUrls.hotelServiceBaseUrl+HotelsUrls.showHotels));
      if(response.statusCode == 200){
        print(response.statusCode);
        var info = jsonDecode(response.body);
        List<OneHotel> op = [];
        print(info["results"].length);
        for(int i=0;i<info["results"].length; i++){
          OneHotel oneHotel = OneHotel(
              hotelId: info["results"][i]["id"],
              cityId: info["results"][i]["city"],
              hotelMainPhoto: info["results"][i]["main_image"],
              hotelName: info["results"][i]["name"],
              hotelEmail: info["results"][i]["email"],
              hotelPhone: info["results"][i]["phone"],
              hotelCountry: info["results"][i]["country"],
              hotelCity: "",
              creationDate: info["results"][i]["date_created"],
              numberOfRates: info["results"][i]["number_of_rates"],
              sumOfRates: info["results"][i]["sum_of_rates"]);
          op.add(oneHotel);

        }
        HotelObject hotelObject = HotelObject(count: info["count"], nextUrl: info["next"] ?? "", previousUrl: info["previous"] ?? "", oneHotel: op);
        for(int i=0;i<hotelObject.oneHotel.length;i++){
          print(hotelObject.nextUrl);
          print(hotelObject.previousUrl);
          print(hotelObject.count);
          print(hotelObject.oneHotel[i].cityId);
          print(hotelObject.oneHotel[i].hotelId);
          print(hotelObject.oneHotel[i].sumOfRates);
          print(hotelObject.oneHotel[i].numberOfRates);
          print(hotelObject.oneHotel[i].creationDate);
          print(hotelObject.oneHotel[i].hotelCity);
          print(hotelObject.oneHotel[i].hotelCountry);
          print(hotelObject.oneHotel[i].hotelPhone);
          print(hotelObject.oneHotel[i].hotelEmail);
          print(hotelObject.oneHotel[i].hotelName);
          print(hotelObject.oneHotel[i].hotelMainPhoto);
        }
        return Tuple2(true,hotelObject);
      } else {
        print(response.statusCode);
        print(jsonDecode(response.body));
        return Tuple2(false, jsonDecode(response.body).toString());
      }
    }catch(e){
      print("this is the error $e");
      return Tuple2(false, e.toString());
    }
    
  }

  Future getHotelDetails (int hotelId) async {

    try{
      late int commentId ,hotelIdd, userId,featureId,imageId;
      late String commentText,featureName,featureIcon,image,stayType,price,stayDescription;
      List<HotelImage> staysImages = [];
      var secondFunctionInfo;
      bool firstFun = false , secondFun = false , thirdFun = false , fourthFun = false, lastFun = false;
      Response firstFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelComments}$hotelId"));
      if(firstFunctionResponse.statusCode == 200){
        firstFun = true;
        print ("first Function work successful ${firstFunctionResponse.statusCode}");
        var info = jsonDecode(firstFunctionResponse.body);
        commentId = info["id"];
        hotelIdd = info["hotel_id"];
        userId = info["user"];
        commentText = info["comment_text"];
      } else {
        print("first function is not working and the error is ${jsonDecode(firstFunctionResponse.body)}");
        firstFun = false;
      }
      Response secondFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelDetails}$hotelId"));
      if(secondFunctionResponse.statusCode == 200){
        firstFun = true;
        print ("second Function work successful ${secondFunctionResponse.statusCode}");
        var info = jsonDecode(secondFunctionResponse.body);
        secondFunctionInfo = info;
      } else {
        print("second function is not working and the error is ${jsonDecode(secondFunctionResponse.body)}");
        secondFun = false;
      }
      Response thirdFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelFeatures}$hotelId"));
      if(thirdFunctionResponse.statusCode == 200){
        thirdFun = true;
        print ("third Function work successful ${thirdFunctionResponse.statusCode}");
        var info = jsonDecode(thirdFunctionResponse.body);
        featureId = info["id"];
        featureName = info["name"];
        featureIcon = info["icone"];
      } else {
        print("third function is not working and the error is ${jsonDecode(thirdFunctionResponse.body)}");
        thirdFun = false;
      }

      Response fourthFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelImage}"));
      if(fourthFunctionResponse.statusCode == 200){
        fourthFun = true;
        print ("fourth Function work successful ${fourthFunctionResponse.statusCode}");
        var info = jsonDecode(fourthFunctionResponse.body);
        imageId = info["id"];
        image = info["image"];
      } else {
        print("fourth function is not working and the error is ${jsonDecode(fourthFunctionResponse.body)}");
        fourthFun = false;
      }

      Response lastFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelStays}$hotelId"));
      if(lastFunctionResponse.statusCode == 200){
        lastFun = true;
        print ("last Function work successful ${lastFunctionResponse.statusCode}");
        var info = jsonDecode(lastFunctionResponse.body);
        stayType = info["stay_type"];
        price = info["price"];
        stayDescription = info["description"];
        for(int i=0;i<info["stay_images"].length;i++){
          HotelImage hotelImage = HotelImage(relatedObjectToThisImageId: info["stay_images"][i]["stay"], imageId: info["stay_images"][i]["id"], image: info["stay_images"][i]["image"]);
          staysImages.add(hotelImage);
        }
      } else {
        print("last function is not working and the error is ${jsonDecode(lastFunctionResponse.body)}");
        lastFun = false;
      }

      if(firstFun&&secondFun&&thirdFun&&fourthFun&&lastFun){
        HotelComments hotelComments = HotelComments(commentId: commentId, hotelId: hotelIdd, userId: userId, comment: commentText);
        OneHotel oneHotel = OneHotel(
            hotelId: secondFunctionInfo["id"],
            cityId: secondFunctionInfo["city"],
            hotelMainPhoto: secondFunctionInfo["main_image"],
            hotelName: secondFunctionInfo["name"],
            hotelEmail: secondFunctionInfo["email"],
            hotelPhone: secondFunctionInfo["phone"],
            hotelCountry: secondFunctionInfo["country"],
            hotelCity: "",
            creationDate: secondFunctionInfo["date_created"],
            numberOfRates: secondFunctionInfo["number_of_rates"],
            sumOfRates: secondFunctionInfo["sum_of_rates"]
        );
        HotelFeatures hotelFeatures = HotelFeatures(featureId: featureId, hotelId: hotelIdd, name: featureName, icon: featureIcon);
        HotelImage hotelImage = HotelImage(relatedObjectToThisImageId: hotelIdd, imageId: imageId, image: image);
        HotelStays hotelStays = HotelStays(hotelId: hotelIdd, description: stayDescription, price: price, staysImage: staysImages, stayType: stayType);
        HotelDetails hotelDetails = HotelDetails(oneHotel: oneHotel, hotelComments: hotelComments, hotelFeatures: hotelFeatures, hotelImage: hotelImage, hotelStays: hotelStays);
        return Tuple2(true, hotelDetails);
      } else {
        return const Tuple2(false, "an Error occurs when connect to the server please tyr again later");
      }

    }catch(e){
      return Tuple2(false, e.toString());
     }

  }


}