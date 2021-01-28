import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
  MyIcons(this.value);

  final String value;
  //final String color;

  @override
  Widget build(BuildContext context) {
    switch (value) {
      /*case 'facebook':
        {
          return Icon(FontAwesomeIcons.facebook, color: HexColor(color));
        }
        break;

      case 'twitter':
        {
          return Icon(FontAwesomeIcons.twitter, color: HexColor(color));
        }
        break;

      default:
        {
          return Icon(FontAwesomeIcons.home, color: HexColor(color));
        }
        break;*/

      case 'Icons.fastfood':
        {
          return Icon(Icons.fastfood, color: Colors.white);
        }
        break;

      case 'Icons.important_devices':
        {
          return Icon(Icons.important_devices, color: Colors.white);
        }
        break;

      case 'Icons.directions_car':
        {
          return Icon(Icons.directions_car, color: Colors.white);
        }
        break;

      case 'Icons.pets':
        {
          return Icon(Icons.pets, color: Colors.white);
        }
        break;

      case 'Icons.handyman':
        {
          return Icon(Icons.handyman, color: Colors.white);
        }
        break;

      case 'Icons.star_border':
        {
          return Icon(Icons.star_border, color: Colors.white);
        }
        break;

      case 'Icons.fitness_center':
        {
          return Icon(Icons.fitness_center, color: Colors.white);
        }
        break;

      case 'Icons.wine_bar':
        {
          return Icon(Icons.wine_bar, color: Colors.white);
        }
        break;

      case 'Icons.weekend':
        {
          return Icon(Icons.weekend, color: Colors.white);
        }
        break;

      case 'Icons.miscellaneous_services':
        {
          return Icon(Icons.miscellaneous_services, color: Colors.white);
        }
        break;

      default:
        {
          return Icon(Icons.home, color: Colors.white);
        }
        break;
    }
  }
}
