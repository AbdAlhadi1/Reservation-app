class UserUrls{
  //"http://127.0.0.1:8006""192.168.1.101:8006"
  static const String userServiceBaseUrl = "https://awsdayoubusers.pythonanywhere.com/";
  static const String loginUrl = "users/login/";
  static const String signupUrl = "users/signup/";
  static const String sendEmailAndReceiveVerificationCode = "users/SendEmailAndReceiveVerificationCodeEmail/";
  static const String sendVerificationCode = "users/SendVerificationCode/";
  static const String sendNewPasswordForForgetPassword = "users/password_reset/";
  static const String logoutUrl = "users/logout/";
  static const String editUserInfo = "users/edit_user_info/";
}



class HotelsUrls{

  static const String hotelServiceBaseUrl = "https://awsdayoubhotels.pythonanywhere.com/";
  static const String getCities = "hotel/show_cities/";
  static const String searchForHotelUrl = "/hotel/search_for_hotels/";
  static const String showHotels = "/hotel/show_hotels/";
  static const String getHotelComments = "/hotel/show_hotel_comments/";
  static const String getHotelDetails = "/hotel/show_hotel_details/";
  static const String getHotelFeatures = "/hotel/show_hotel_features/";
  static const String getHotelImage = "/hotel/show_hotel_images/";
  static const String getHotelStays = "/hotel/show_hotel_stays/";
  static const String bookHotel = "hotel/reserve/";
  static String showHotelReservation = "hotel/show_customer_reservations/";
}

class CarUrls{
  static const String carServiceBaseUrl = "https://awsdayoubcars.pythonanywhere.com/";
  static const String showCarCompany = "carcompany/show_car_comapnies/";
  static const String showCars = "carcompany/show_cars/";
  static const String searchForCar = "carcompany/search_for_car_companies/";
  static const String getCities  = "carcompany/show_cities/";
  static const String showUserReservation = "carcompany/show_customer_reservations/";
  static const String bookCar = "carcompany/add_car_reservation/";
}