import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'home.dart';

class Detalles extends StatefulWidget {
  @override
  _DetallesState createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  @override
  var dialog = 0;
  String estado = "pendiante";

  Widget build(BuildContext context1) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del Servicio"),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: <Widget>[],
      ),
      body: Container(
        color: Colors.orange,
        height: MediaQuery.of(context).size.height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
          ),
          margin: EdgeInsets.only(left: 30, bottom: 30, top: 20),
          elevation: 8,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    )),
                height: 40,
                alignment: Alignment.topCenter,
                child: Center(
                    child: Text(
                  "Pendiente",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
              new SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        new ListTile(
                          leading: const Icon(Icons.location_on),
                          title: const Text('Direccion Destino'),
                          subtitle: const Text('None'),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        new ListTile(
                          leading: const Icon(Icons.location_on),
                          title: const Text('Direccion Origen'),
                          subtitle: const Text('February 20, 1980'),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        new ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Cliente'),
                          subtitle: const Text('Not specified'),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        new ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Telefono'),
                          subtitle: const Text('312578998'),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        new ListTile(
                          leading: const Icon(Icons.attach_money),
                          title: const Text('Precio'),
                          subtitle: const Text('5000'),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        new ListTile(
                          leading: const Icon(Icons.event),
                          title: const Text('Fecha'),
                          subtitle: const Text('2022-03-07'),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        new ListTile(
                          leading: const Icon(Icons.details),
                          title: const Text('Observaciones'),
                          subtitle: const Text(
                              'i dont think you can do it with the AppBar widget, but you can build your own like this: not my best code but i think this can help you have an idea on how to do it'),
                        ),
                        const Divider(
                          height: 1.0,
                        ),

                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'imageHero',
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        label: Text('ACTUALIZAR ESTADO',style: TextStyle(),),
        onPressed: () {
          Alert(
            context: context,
            type: AlertType.warning,
            title: "SERVICIO ENTREGADO",
            desc: "Actializar estado del servicio",
            buttons: [
              DialogButton(
                child: Text(
                  "candelar",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: Color.fromRGBO(0, 179, 134, 1.0),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(249, 171, 5, 1.0),
                  Color.fromRGBO(255, 227, 51, 1.0),
                ]),
              ),
              DialogButton(
                child: Text(
                  "ok",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Home()),
                          (route) => true);
                },
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(255, 227, 51, 1.0),
                  Color.fromRGBO(249, 171, 5, 1.0)
                ]),
              )
            ],
          ).show();
          // Respond to button press
        },
        icon: Icon(Icons.update),
      ),
    );
  }
}
