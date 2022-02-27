
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:work_app/feedEmployee.dart';

import 'feedEmployer.dart';

class LastRoute extends StatelessWidget {
  const LastRoute( {Key? key,
    required this.userType
  }) : super(key: key);
  final String userType;


  @override
  Widget build(BuildContext context) {
    return  IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
           if (userType == "employee"){
             Navigator.of(context).push(
               //widget de builder para abrir nueva pagina al hacer push al stack de navegacion
               MaterialPageRoute(
                 builder: (context) {
                   //estructura de la pagina
                   return feedEmployee();
                 },
               ),
             );
           }else{
             Navigator.of(context).push(
               //widget de builder para abrir nueva pagina al hacer push al stack de navegacion
               MaterialPageRoute(
                 builder: (context) {
                   //estructura de la pagina
                   return feedEmployer();
                 },
               ),
             );
           }


          },
    );


  }
}