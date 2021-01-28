import 'package:flutter/material.dart';

class Category {
  String title;
  String subtitle;
  String icon;
  String color;

  Category(this.title, this.subtitle, this.icon, this.color);
}

Map<String, Color> myColors = {
  'Colors.red': Colors.red,
  'Colors.blue': Colors.blue,
  'Colors.green': Colors.green,
  'Colors.orange': Colors.orange,
  'Colors.grey': Colors.grey,
  'Colors.purple': Colors.purple,
  'Colors.amber': Colors.amber,
  'Colors.pink': Colors.pink,
  'Colors.teal': Colors.teal,
  'Colors.blueGrey': Colors.blueGrey
};

Map<String, IconData> myIcons = {
  'Icons.fastfood': Icons.fastfood,
  'Icons.important_devices': Icons.important_devices,
  'Icons.directions_car': Icons.directions_car,
  'Icons.pets': Icons.pets,
  'Icons.handyman': Icons.handyman,
  'Icons.star_border': Icons.star_border,
  'Icons.fitness_center': Icons.fitness_center,
  'Icons.wine_bar': Icons.wine_bar,
  'Icons.weekend': Icons.weekend,
  'Icons.miscellaneous_services': Icons.miscellaneous_services,
};

List<Category> categories = [
  Category("Alimentação & Bebidas", "10 Itens", "Icons.fastfood", "Colors.red"),
  Category("Informática & Tecnologia", "11 Itens", "Icons.important_devices",
      "Colors.blue"),
  Category("Automotivo & Serviços", "12 Itens", "Icons.directions_car",
      "Colors.green"),
  Category("Animais de Estimação", "4 Itens", "Icons.pets", "Colors.orange"),
  Category("Construção & Reformas", "8 Itens", "Icons.handyman", "Colors.grey"),
  Category(
      "Beleza & Estética", "6 Itens", "Icons.star_border", "Colors.purple"),
  Category("Esportes & Academias", "10 Itens", "Icons.fitness_center",
      "Colors.amber"),
  Category("Festas & Eventos", "3 Itens", "Icons.wine_bar", "Colors.pink"),
  Category("Móveis & Decorações", "10 Itens", "Icons.weekend", "Colors.teal"),
  Category(" Prestadores de Serviços", "20 Itens",
      "Icons.miscellaneous_services", "Colors.blueGrey"),
];
