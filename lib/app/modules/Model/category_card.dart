import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:service_app/app/modules/Model/categoryModel.dart';
import 'package:service_app/app/modules/util/my_Icons.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.only(left: 20.0, bottom: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: myColors[category.color],
            child: IconButton(
              icon: MyIcons(category.icon)
                  .build(context), //SvgPicture.asset(category.icon)
              color: Colors.white,
              onPressed: () {
                Map<String, Object> paramMap = {
                  'categoryName': category.title,
                  'categoryIcon': category.icon,
                };
                Modular.to.pushNamed('/listResult', arguments: paramMap);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(category.title,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Text(category.subtitle,
              style: TextStyle(fontSize: 10, color: Colors.blueGrey[300])),
        ],
      ),
    );
  }
}
