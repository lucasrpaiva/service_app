import 'package:flutter/material.dart';
import 'package:service_app/app/modules/Model/categoryModel.dart';

class CategoryCardAll extends StatelessWidget {
  final Category category;
  const CategoryCardAll({this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: myColors[category.color],
            child: Icon(
              myIcons[category.icon], //SvgPicture.asset(category.icon)
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(category.title,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
