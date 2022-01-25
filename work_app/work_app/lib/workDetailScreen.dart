import 'package:flutter/material.dart';
import 'workModel.dart';

import 'db_controller.dart';
//import './categories_constants.dart';

//holaaaaaaaaaaaaa
class DetailScreen extends StatefulWidget {
  final WorkModel service;
  DetailScreen({Key? key, required this.service}) : super(key: key);

  @override
  State<DetailScreen> createState() => DetailScreenState(service: this.service);
}

class DetailScreenState extends State<DetailScreen> {
  DatabaseController dbController = DatabaseController();
  late WorkModel service;
  DetailScreenState({required this.service}) : super();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.categoria),
        // backgroundColor: categoriesIconsColors[service.categoria],
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Service name
        Padding(
          padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 3),
          child: Text(
            service.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        // Service description
        Padding(
          padding: EdgeInsets.only(top: 6, left: 24, right: 24, bottom: 24),
          child: Text(
            service.description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 6, left: 24, right: 24, bottom: 24),
          child: Text(
            service.workerNum.toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 6, left: 24, right: 24, bottom: 24),
          child: Text(
            service.location,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
        ),

        // Horarios de servicio (heading)
      ])),
    );
  }
}
