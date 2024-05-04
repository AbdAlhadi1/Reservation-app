import 'package:flutter/material.dart';

class CategoryItemForHomePage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var onTap;
  String categoryName , imageForTheCategory;

  CategoryItemForHomePage({
    super.key,
    required this.onTap,
    required this.categoryName,
    required this.imageForTheCategory,
  });
  Color mainColor = const Color(0xFF262B44), secondColor = const Color(0xFFed3954), thirdColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image(image: AssetImage(imageForTheCategory,),width: 70,height: 70,),

            Expanded(
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(categoryName,style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: secondColor
                    ),),
                ),
              ),
            ),
            ],
        ),
      ),
    );
  }
}
