

import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
        return Tuple2(true,cities);
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



  Future searchForHotel(TextEditingController word) async{
    try{
      Response response = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.searchForHotelUrl}${word.text}"));
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

        HotelObject hotelObject = HotelObject(count: info["count"], nextUrl: info["next"]  ?? "", previousUrl: info["previous"] ?? "", oneHotel: op);
        return Tuple2(true, hotelObject);
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
    late int hotelIdd,featureId,imageId,stayId;
    late String featureName,featureIcon,image,stayType,price,stayDescription;
    List<HotelImage> staysImages = [];
    List<HotelFeatures> hotelFeatures = [];
    List<HotelComments> hotelComments =[];
    var secondFunctionInfo;
    //bool firstFun = false , secondFun = false , thirdFun = false , fourthFun = false, lastFun = false;
    try{
      Response firstFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelComments}$hotelId"));
      if(firstFunctionResponse.statusCode == 200){
        print ("first Function work successful ${firstFunctionResponse.statusCode}");
        var info = jsonDecode(firstFunctionResponse.body);
        for(int i=0;i<info.length;i++){
          HotelComments hotelComment = HotelComments(commentId: info[i]["id"], hotelId: hotelId, userId: info[i]["user"], comment: info[i]["comment_text"]);
          hotelComments.add(hotelComment);
        }
        print("hotel comments${hotelComments.length}");
        try{
          Response thirdFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelFeatures}$hotelId"));
          if(thirdFunctionResponse.statusCode == 200){
           // thirdFun = true;
            print ("third Function work successful ${thirdFunctionResponse.statusCode}");
            var info1 = jsonDecode(thirdFunctionResponse.body);
            print(info1);

            for(int i=0;i<info1.length;i++){
              HotelFeatures hotelFeature = HotelFeatures(featureId: info1[i]["id"], hotelId: hotelId, name: info1[i]["name"], icon: info1[i]["icone"]);
              hotelFeatures.add(hotelFeature);
            }
            print(hotelFeatures.length);
            for(int i=0;i<hotelFeatures.length;i++){
              print(hotelFeatures[i].name);
              print(hotelFeatures[i].icon);
              print(hotelFeatures[i].hotelId);
            }

            return Tuple2(true, [hotelComments,hotelFeatures]);
          } else {
            print(thirdFunctionResponse.statusCode);
            print("third function is not working and the error is ${jsonDecode(thirdFunctionResponse.body)}");
            var error = jsonDecode(thirdFunctionResponse.body);
            return Tuple2(false, error["detail"].toString());
          }
        } catch(e) {
          return Tuple2(false, e.toString());
        }

      } else {
        print(firstFunctionResponse.statusCode);
        print("first function is not working and the error is ${jsonDecode(firstFunctionResponse.body)}");
        var error = jsonDecode(firstFunctionResponse.body);
        return Tuple2(false, error["detail"].toString());
      }
    }catch(e){
      return Tuple2(false, e.toString());
      }

  }


  Future secondHotelDetails (int hotelId) async {
    try{

      List<HotelImage> hotelImages = [];
      List<HotelStays> hotelStays = [];
      Response lastFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelStays}$hotelId"));
      if(lastFunctionResponse.statusCode == 200){
        print ("last Function work successful ${lastFunctionResponse.statusCode}");
        var info = jsonDecode(lastFunctionResponse.body);
        print(info);
        for(int i=0;i<info.length;i++){
          List<HotelImage> staysImages = [];
          /*for(int j=0;j<info[i]["stay_images"].length;j++){
            HotelImage hotelImage = HotelImage(relatedObjectToThisImageId: info[i]["stay_images"][j]["stay"], imageId: info[i]["stay_images"][j]["id"], image: info[i]["stay_images"][j]["image"]);
            staysImages.add(hotelImage);
          }*/
          HotelStays hotelStay = HotelStays(hotelId: hotelId, stayId: info[i]["id"], description: info[i]["description"], price: info[i]["price"], staysImage: staysImages, stayType: info[i]["stay_type"]);
          hotelStays.add(hotelStay);
        }
        return Tuple2(true, hotelStays);
        /*try {
          Response fourthFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelImage}"));
          if (fourthFunctionResponse.statusCode == 200) {
            print("fourth Function work successful ${fourthFunctionResponse.statusCode}");
            var info1 = jsonDecode(fourthFunctionResponse.body);
            print(info1);
            for(int i=0;i<info1.length;i++){
              HotelImage hotelImage = HotelImage(relatedObjectToThisImageId: info1[i]["hotel"], imageId: info1[i]["id"], image: info1[i]["image"]);
              hotelImages.add(hotelImage);
            }
          } else {
            print("fourth function is not working and the error is ${jsonDecode(fourthFunctionResponse.body)}");
            var error = jsonDecode(fourthFunctionResponse.body);
            return Tuple2(false, error["detail"].toString());
          }

        } catch(e) {
          print("helooooooooo");
          return Tuple2(false, e.toString());
        }*/

      } else {
        print("last function is not working and the error is ${jsonDecode(lastFunctionResponse.body)}");
        var error = jsonDecode(lastFunctionResponse.body);
        return Tuple2(false, error["detail"].toString());

      }
    } catch(e) {
      return Tuple2(false, e.toString());
    }



  }
  Future bookHotel (int hotelId,int stayId,int userId,TextEditingController startDate, TextEditingController endDate)async{
    try {
      print(hotelId);
      print(stayId);
      print(userId);
      print(startDate.text);
      print(endDate.text);
      final body = jsonEncode( {
        "hotel_id": hotelId,
        "stay_id": stayId,
        "user_id": userId,
        "start_date": startDate.text,
        "end_date": endDate.text,
        "note": ""
      });
      Response response = await post(Uri.parse(HotelsUrls.hotelServiceBaseUrl+HotelsUrls.bookHotel),body:body,headers: {
      'Content-Type': 'application/json'
      });
      if(response.statusCode == 200){
        print (response.statusCode);
        return const Tuple2(true, "Done");
      } else {
        print(response.statusCode);
        return Tuple2(false, jsonDecode(response.body).toString());
      }
    }catch(e){
      return Tuple2(false, e.toString());
    }

  }


}






/*if(firstFun&&secondFun&&thirdFun&&fourthFun&&lastFun){

//HotelFeatures hotelFeatures = HotelFeatures(featureId: featureId, hotelId: hotelId, name: featureName, icon: featureIcon);
HotelImage hotelImage = HotelImage(relatedObjectToThisImageId: hotelId, imageId: imageId, image: image);
HotelStays hotelStays = HotelStays(stayId: stayId,hotelId: hotelId, description: stayDescription, price: price, staysImage: staysImages, stayType: stayType);
HotelDetails hotelDetails = HotelDetails(oneHotel: oneHotel, hotelComments: hotelComments, hotelFeatures: hotelFeatures, hotelImage: hotelImage, hotelStays: hotelStays);
return Tuple2(true, hotelDetails);
} else {
return const Tuple2(false, "an Error occurs when connect to the server please tyr again later");
}




try{
Response lastFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelStays}$hotelId"));
if(lastFunctionResponse.statusCode == 200){
lastFun = true;
print ("last Function work successful ${lastFunctionResponse.statusCode}");
var info = jsonDecode(lastFunctionResponse.body);
stayId = info["id"];
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
} catch(e) {
return Tuple2(false, e.toString());
}

//////////////////////

try {
Response fourthFunctionResponse = await get(Uri.parse(
"${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelImage}"));
if (fourthFunctionResponse.statusCode == 200) {
fourthFun = true;
print("fourth Function work successful ${fourthFunctionResponse
    .statusCode}");
var info = jsonDecode(fourthFunctionResponse.body);
imageId = info["id"];
image = info["image"];



} else {
print("fourth function is not working and the error is ${jsonDecode(
fourthFunctionResponse.body)}");
fourthFun = false;
}
} catch(e) {
return Tuple2(false, e.toString());
}

////////////////////////



//////////////////////

try{
Response secondFunctionResponse = await get(Uri.parse("${HotelsUrls.hotelServiceBaseUrl}${HotelsUrls.getHotelDetails}$hotelId"));
if(secondFunctionResponse.statusCode == 200){
secondFun = true;
print ("second Function work successful ${secondFunctionResponse.statusCode}");
var info = jsonDecode(secondFunctionResponse.body);
secondFunctionInfo = info;



} else {
print(secondFunctionResponse.statusCode);
print("second function is not working and the error is ${jsonDecode(secondFunctionResponse.body)}");
secondFun = false;
}
}catch(e) {
return Tuple2(false, e.toString());
}*/