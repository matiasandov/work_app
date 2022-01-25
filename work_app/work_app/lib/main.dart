import 'package:flutter/material.dart';

import 'category_model.dart';
import 'db_controller.dart';

import 'employeeProfileCreate.dart';
import 'employerProfileCreate.dart';
//holaaaa
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iWork',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'iWork'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  

  void _pushEmployerScreen() async {
    Navigator.of(context).push(
      //widget de builder para abrir nueva pagina al hacer push al stack de navegacion
      MaterialPageRoute(
        builder: (context) {


          //estructura de la pagina
          return employerCreateScreen();
        },
      ),
    );
  }

  void _pushEmployeeScreen() async {
    Navigator.of(context).push(
      //widget de builder para abrir nueva pagina al hacer push al stack de navegacion
      MaterialPageRoute(
        builder: (context) {


          //estructura de la pagina
          return employeeCreateScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            

          const Image(image: AssetImage('assets/iWork.png')),

            SizedBox(

                child: FloatingActionButton.extended(
                    backgroundColor: const Color(0xff03dac6),
                    onPressed: () => _pushEmployerScreen(),
                    label:  Text("Employer",
                        textScaleFactor: 1.5
                    ),
                    //child: Container(
                      //child: Text("Employer"),

                    )
                ),



            SizedBox(

              child: FloatingActionButton.extended(
                  onPressed: () => _pushEmployeeScreen(),
                  label:  Text("Employee",
                      textScaleFactor: 1.5
                  ),

                  )
              ),



            const Text(
              'The informal economy represented 21.9% of the Mexican gross domestic product (GDP) in 2020. Thanks to iWork, we are creating connections between hardworking people. ',
            ),


          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

 

}//_MyHomePageState