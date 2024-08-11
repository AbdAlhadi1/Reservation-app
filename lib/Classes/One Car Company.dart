class OneCarCompany{
  late int carCompanyId,cityId;
  late String carCompanyMainPhoto,
      carCompanyName,
      carCompanyEmail,
      carCompanyPhone,
      carCompanyCountry,
      carCompanyCity,
      carCompanyDate,
      sumOfRates,
      numberOfRates;
  OneCarCompany({
   required this.carCompanyId,
   required this.cityId,
   required this.carCompanyName,
   required this.carCompanyEmail,
   required this.carCompanyCountry,
   required this.carCompanyCity,
   required this.carCompanyDate,
   required this.carCompanyMainPhoto,
   required this.carCompanyPhone,
    required this.numberOfRates,
    required this.sumOfRates,
});
}