// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';


class Service {
  Service({
    this.idService,
    this.idCliente,
    this.idDeliv,
    this.price,
    this.destination,
    this.source,
    this.observation,
    this.idStatus,
    this.creation_date,
    this.closing_date,
    this.fechaIni
  });

  int idService;
  int idCliente;
  int idDeliv;
  int price;
  String destination;
  String source;
  String observation;
  int idStatus;
  String creation_date;
  String closing_date;
  String fechaIni;


  factory Service.fromJson(Map<String, dynamic> json){
   return  Service(
      idService: json['id'] as int,
      idCliente: json["id_client"] as int,
      idDeliv: json["id_deliv"] as int,
      price: json["price"] as int,
      destination: json["destination"] as String,
      source: json["source"] as String,
      observation: json["observation"] as String,
      idStatus: json["id_status"] as int,
      fechaIni: json["creation_date"]


    );
  }


  Map<String, dynamic> toJson() => {
    "id": idService,
    "id_cliente": idCliente,
    "id_deliv": idDeliv,
    "price": price,
    "destination": destination,
    "source": source,
    "observation": observation,
    "id_status": idStatus,
  };

}
