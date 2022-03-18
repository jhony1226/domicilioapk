import 'dart:convert';
import 'package:appdomiicilios/models/services.dart';
import 'package:appdomiicilios/vistas/detalles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appdomiicilios/models/ApiString.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  var _formKey = GlobalKey<FormState>();
  var glovalkey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<List<Service>> fetchPhotos() async {
    List<Service> _loadAds = [];
    final response =
        await http.get(Uri.parse("${ApiStrings.url}/services/getServices/"));
    if (response.statusCode == 200) {
      // List<Ads> getAdsHere = response.body["ads"] as List<Ads>;
      final parsed = jsonDecode(response.body);
      for (var i = 0; i < parsed["servicios"].length; i++) {

        Map<String, dynamic> map = parsed["servicios"][i];
        _loadAds.add(Service.fromJson(map));
        // _loadAds.add(parsed["ads"][i]);
      }
      return _loadAds;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget listar(List<Service> snapshot) {
    if (snapshot.length == 0) {
      return Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          elevation: 12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: Image.asset(
                  'assets/img/logo.png',
                ),
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text("No Tienes Servicios Asignados")),
            ],
          ),
        ),
      );
    } else {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: snapshot.length,
          itemBuilder: (context, index) {final f = new DateFormat('yyyy-MM-dd hh:mm');
           var fecha= DateTime.parse(snapshot[index].fechaIni);
           String fecha1= f.format(fecha);
            return Container(
                child: InkWell(mouseCursor:MaterialStateMouseCursor.textable,
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Detalles()), (route) => true);
              },
              child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),

                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 8,
                  child: Column(
                    children: [
                      ListTile(
                        //=========seccion de titulos=======
                        leading:
                            Icon(Icons.pending, color: Colors.orange, size: 50),
                        title:
                            new Text("Destino: ${snapshot[index].destination}"),
                        subtitle: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "Direccion: ${snapshot[index].source}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: new Container(
                                alignment: Alignment.topLeft,
                                child: new Text(
                                  "Cliente: ${snapshot[index].idCliente} ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(fecha1,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        "Total: ${snapshot[index].price}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
            );
          });
    }
  }

  // Future<Post> fetchPost() async {
  //   final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  //
  //   if (response.statusCode == 200) {
  //     // Si la llamada al servidor fue exitosa, analiza el JSON
  //     return Post.fromJson(json.decode(response.body));
  //   } else {
  //     // Si la llamada no fue exitosa, lanza un error.
  //     throw Exception('Failed to load post');
  //   }
  // }

  // Future<List<Service>> fetchPhotos(http.Client service) async {
  //   final response = await service.get(Uri.parse("${ApiStrings.url}/services/getServices/"));
  //
  //   // Use the compute function to run parsePhotos in a separate isolate.
  //   return parseService(response.body);
  // }
  // List<Service> parseService(String responseBody) {
  //   print(jsonDecode(responseBody)['service']);
  //   var srt="{id: 7, id_client: 8, id_deliv: 7, price: 8000, destination: Atalaya, source: oficina principal, observation: Delicado, id_status: 1, }, {id: 6, id_client: 8, id_deliv: 7, price: 8000, destination: Centro, source: oficina principal, observation: Delicado, id_status: 1, }, {id: 8, id_client: 7, id_deliv: 7, price: 8000, destination: Atalaya, source: oficina principal, observation: Delicado, id_status: 1, }";
  //   final parsed = jsonDecode(srt).cast<Map<String, dynamic>>();
  //   print(parsed);
  //
  //   return parsed.map<Service>((json) => Service.fromJson(json)).toList();
  // }

  // Future<List<Service>> getSevices() async {
  //   final response = await http.get();
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
  //     print(Service.fromJson(jsonDecode(response.body)));
  //     parsed.map<Service>((json) => Service.fromJson(json)).toList();
  //     return Service.fromJson(jsonDecode(response.body));
  //   }else{
  //     print('Service.fromJson(json.decode(response.body))');
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          elevation: 8,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              label: "Pendientes",
              icon: Icon(
                Icons.assignment_outlined,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.verified_outlined,
                    color: Colors.white
                ),
                label: "Historial",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        child: Container(
          child: Stack(
            children: <Widget>[
              Icon(
                Icons.notifications,
                size: 30,
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 15,
                    minHeight: 15,
                  ),
                  child: Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
        onPressed: () {},
      ),
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[

            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.orange,
              automaticallyImplyLeading: true,
              expandedHeight: 150,
              floating: true,
              // forceElevated: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  " ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
                collapseMode: CollapseMode.pin,
                background:
                Image.asset(
                  'assets/img/home.png',
                  fit: BoxFit.fill,
                ),
              ),
              centerTitle: true,
              elevation: 1.0,
            ),
          ];
        },
        body: Container(
          child: FutureBuilder<List<Service>>(
            future: fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                 print(snapshot.error);
                return   Text("error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                List<Service> serviciosList = [];
                switch (_selectedIndex) {
                  case 0:
                    for (var serv in snapshot.data) {
                      if (serv.idStatus == 1) serviciosList.add(serv);
                    }
                    break;
                  case 1:
                    for (var serv in snapshot.data) {
                      if (serv.idStatus == 2) serviciosList.add(serv);
                    }
                    break;
                }
                return listar(serviciosList);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

