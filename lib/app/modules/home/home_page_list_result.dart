import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:service_app/app/modules/Model/serviceModel.dart';
import 'package:service_app/app/modules/util/my_Icons.dart';
import 'detail_page.dart';
import 'home_controller.dart';

class HomePageListResult extends StatefulWidget {
  final String title;
  final Map<String, Object> paramMap;
  const HomePageListResult(data, {Key key, this.title = "Lista de resultados"})
      : this.paramMap = data,
        super(key: key);

  @override
  _HomePageListResultState createState() => _HomePageListResultState();
}

class _HomePageListResultState
    extends ModularState<HomePageListResult, HomeController> {
  TextEditingController editingController = TextEditingController();
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xFF1565C0);

  final List<Service> serviceListOriginal = List<Service>();
  final List<Service> serviceLists = [
    Service(
        1,
        "Jair Eletricista",
        "Rua: João Ramalho, 12483 Vila Brasil",
        "Eletricista residencial",
        "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"),
    Service(
        2,
        "João Pedreiro",
        "Rua: Nadir figueiredo, 321 D. Nicolau",
        "Do básico ao acabamento",
        "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"),
    Service(
        3,
        "Start Construções",
        "Av. Aquidaban, 12345 Centro",
        "Construtora",
        "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"),
    Service(4, "Julio Pintor", "Kasai Pantan NY, 12483", "Pintura residencial",
        "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"),
    Service(
        5,
        "Gesso & cia",
        "Rua: Benedito Rodrigues, 12333",
        "Gesso em geral",
        "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"),
    Service(
        6,
        "Alumi aço",
        "Luiz Lázaro Zamenhoff, 18",
        "Esquadrias de Alumínio",
        "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"),
    Service(8, "Haward Play", "572 Statan NY, 12483", "Play Group School",
        "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"),
    Service(
        9,
        "Campare Handeson",
        "Kasai Pantan NY, 12483",
        "Lower Secondary School",
        "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"),
  ];

  @override
  void initState() {
    serviceListOriginal.addAll(serviceLists);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: serviceLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList2(context, index);
                    }),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/services_background.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Colors.white, size: 29),
                          onPressed: () => Navigator.of(context).pop()),
                      MyIcons(
                          // faz replace para pegar o nome do icone
                          widget.paramMap['categoryIcon']).build(context),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.paramMap['categoryName'],
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          onChanged: (value) {
                            filterSearchResults(value);
                          },
                          controller: editingController,
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Refine sua busca",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3, color: secondary),
              image: DecorationImage(
                  image: NetworkImage(serviceLists[index].logoText),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  serviceLists[index].name,
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(serviceLists[index].location,
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.adjust,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(serviceLists[index].type,
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList2(BuildContext context, int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 3, color: secondary),
          image: DecorationImage(
              image: NetworkImage(serviceLists[index].logoText),
              fit: BoxFit.fill),
        ),
      ),
      title: Text(
        serviceLists[index].name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: 10.0,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(serviceLists[index].type,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(service: serviceLists[index])));
      },
    );
  }

  void filterSearchResults(String query) {
    List<Service> dummySearchList = List<Service>();
    dummySearchList.addAll(serviceListOriginal);
    if (query.isNotEmpty) {
      List<Service> dummyListData = List<Service>();
      dummySearchList
        ..forEach((item) {
          if (item.name.toUpperCase().contains(query.toUpperCase())) {
            dummyListData.add(item);
          }
        });
      setState(() {
        serviceLists.clear();
        serviceLists.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        serviceLists.clear();
        serviceLists.addAll(serviceListOriginal);
      });
    }
  }
}
