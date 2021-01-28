import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:service_app/app/modules/Model/categoryModel.dart';
import 'package:service_app/app/modules/Model/category_card.dart';
import 'package:service_app/app/modules/Model/location.dart';
import 'package:service_app/app/modules/Model/productModel.dart';
import 'package:service_app/app/widgets/custom_list_title.dart';
import 'package:service_app/app/widgets/mainui_customcard.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  double _height;
  double _width;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String cityName = "";
  List<Product> recommendListItems;
  final TextStyle dropdownMenuLabel =
      TextStyle(color: Colors.white, fontSize: 16);
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  List<String> locations = [
    'São João da Boa Vista',
    'Aguai',
    'Vargem Grande do Sul',
    'Poços de Caldas',
  ];
  var selectedLocationIndex = 0;

  @override
  void initState() {
    recommendListItems = [
      Product(
          124,
          "05 Apr 2019",
          "Samsung S9+",
          "Discover Galaxy S9 and S9+ and the revolutionary camera that adapts like the human eye.",
          60000,
          "5 months",
          "Mobiles",
          8377028021,
          "assets/images/samsuns9+.jpg",
          true),
      Product(
          123,
          "02 Apr 2019",
          "Lenovo T450",
          "Discover the Lenovo ThinkPad T450, a 14-inch thin and light business Ultrabook with the newest Intel Core i processor, backlit keyboard and up to 17 hours battery backup.",
          40000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/lenovot450.jpg",
          true),
      Product(
          125,
          "03 Dec 2018",
          "Himalayan",
          "The Himalayan is an ‘all-rounder’ motorcycle built on an all new platform from Royal Enfield. It is a 411cc adventure motorcycle which was partly developed in the United Kingdom. The motorcycle brings a series of firsts for the brand.",
          100000,
          "5 months",
          "Bike",
          8377028021,
          "assets/images/bike.jpg",
          true),
      Product(
          126,
          "15 Mar 2019",
          "Canon 200D",
          "Canon EOS 200D 24.2MP Digital SLR Camera + EF-S 18-55 mm f4 is STM Lens, Free Camera Case and 16GB Card Inside",
          35000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/canon.jpg",
          true),
      Product(
          127,
          "09 Apr 2019",
          "Sofa",
          "Bharat Lifestyle Nano Fabric 6 Seater Sofa",
          4000,
          "5 months",
          "Furniture",
          8377028021,
          "assets/images/sofa.jpg",
          true),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: _drawer(),
      key: scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 290,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/services_background.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            PopupMenuButton(
                              onSelected: (index) {
                                setState(() {
                                  selectedLocationIndex = index;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    locations[selectedLocationIndex],
                                    style: dropdownMenuLabel,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: Text(
                                    locations[0],
                                    style: dropdownMenuItem,
                                  ),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[1],
                                    style: dropdownMenuItem,
                                  ),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[2],
                                    style: dropdownMenuItem,
                                  ),
                                  value: 2,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[3],
                                    style: dropdownMenuItem,
                                  ),
                                  value: 3,
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      /*child: Container(
                  width: double.infinity,
                  height: 280,
                  padding: EdgeInsets.only(bottom: 50.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/services_background.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.black12.withOpacity(.0),
                        elevation: 0.0,
                        leading: GestureDetector(
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onTap: () {
                            scaffoldKey.currentState.openDrawer();
                          },
                        ),
                        actions: [
                          _location(),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Tá na Mão",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Material(
                              borderRadius: BorderRadius.circular(25.0),
                              elevation: 8,
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon:
                                        Icon(Icons.search, color: Colors.blue),
                                    suffix: IconButton(
                                        icon: Icon(
                                          Icons.filter_list,
                                          color: Colors.blue,
                                        ),
                                        tooltip: 'Refinar busca',
                                        onPressed: () {
                                          Modular.to.pushNamed('/listResult',
                                              arguments: 'Alimentação');
                                        }),
                                    hintText: "Busca de serviços",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                              ))),*/
                      Container(
                          width: 250,
                          child: Text(
                            "É pra já!!",
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                      Container(
                          child: Text(
                        "Encontre tudo que precisa em um só lugar!",
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextField(
                            controller: TextEditingController(text: ''),
                            cursorColor: Theme.of(context).primaryColor,
                            style: dropdownMenuItem,
                            decoration: InputDecoration(
                                suffixIcon: Material(
                                  elevation: 2.0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.blue,
                                      ),
                                      tooltip: 'Refinar busca',
                                      onPressed: () {
                                        Map<String, Object> paramMap = {
                                          'categoryName': 'Resultado da busca',
                                          'categoryIcon': 'search',
                                        };
                                        Modular.to.pushNamed('/listResult',
                                            arguments: paramMap);
                                      }),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              CustomListTitle('Categorias'),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 180.0,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (buildContext, index) {
                    var category = categories[index];
                    return CategoryCard(category: category);
                  },
                ),
              ),
              CustomListTitle("Recomendações"),
              SizedBox(
                height: 10.0,
              ),
              recommendations(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _location() {
    final TextStyle dropdownMenuLabel =
        TextStyle(color: Colors.white, fontSize: 14);
    final TextStyle dropdownMenuItem =
        TextStyle(color: Colors.black, fontSize: 16);
    List<Location> locations = [
      Location(1, 'São João da Boa Vista'),
      Location(2, 'Aguaí'),
      Location(3, 'Vargem Gde do Sul'),
    ];
    var selectedLocationIndex = 0;
    cityName = locations[selectedLocationIndex].cityName;
    return Padding(
      padding: EdgeInsets.only(left: _width / 4, right: 12, top: 10),
      child: Container(
        child: Container(
          height: _height / 20,
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                PopupMenuButton(
                  child: Row(
                    children: <Widget>[
                      Text(
                        cityName,
                        style: dropdownMenuLabel,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                  onSelected: (index) {
                    setState(() {
                      selectedLocationIndex = index;
                      locations.forEach((element) {
                        if (element.id == selectedLocationIndex) {
                          cityName = element.cityName;
                        }
                      });
                      print(cityName);
                    });
                  },
                  itemBuilder: (BuildContext context) => locations
                      .map<PopupMenuItem>((element) => PopupMenuItem(
                            textStyle: dropdownMenuItem,
                            child: Text(element.cityName),
                            value: element.id,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Opacity(
            opacity: 0.75,
            child: Container(
              height: _height / 6,
              padding: EdgeInsets.only(top: _height / 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black,
                  ),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                title: Text("FlutterDevs"),
                subtitle: Text(
                  "flutterDevs@aeologic.com",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders & Payments"),
          ),
        ],
      ),
    );
  }

  Widget recommendations() {
    return Container(
      height: _height / 4.25,
      //width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        itemCount: recommendListItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return _buildRecommendationsEntries(
              context, index, recommendListItems);
        },
      ),
    );
  }

  Widget _buildRecommendationsEntries(
      BuildContext context, int index, List<Product> listItem) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushNamed(DETAIL_UI);
        print("Routing to detail page");
      },
      child: CustomCard(
        title: '${listItem[index].title}',
        category: '${listItem[index].category}',
        description: "${listItem[index].desc}",
        image: "${listItem[index].image}",
        location: "Sector 62, Noida",
      ),
    );
  }
}
