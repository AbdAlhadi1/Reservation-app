
import 'package:flutter/material.dart';

Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;
class CityItem extends StatelessWidget {
  String cityName,image;
  var onTap;
  CityItem({
    super.key,
    required this.cityName,
    required this.image,
    required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 10,
          height: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: NetworkImage(image),width: 130,height: 160,fit: BoxFit.cover),
              Expanded(
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Text(cityName,style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: mainColor
                    ),),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
