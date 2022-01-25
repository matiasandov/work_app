import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'feedEmployee.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
//import 'package:image_picker/image_picker.dart';
//import 'package:work_app/imageCapture.dart';





class employeeCreateScreen extends StatelessWidget {

  employeeCreateScreen({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {

    return employeeScreen();
  }
}

class employeeScreen extends StatefulWidget {
  const employeeScreen({Key? key}) : super(key: key);

  @override
  _employeeScreenState createState() => _employeeScreenState();
}

class _employeeScreenState extends State<employeeScreen> with TickerProviderStateMixin{
  //esto es un objeto global que manejara el texto ingresado
  final _textController = TextEditingController();
  final yearController = TextEditingController();
  final experienceController = TextEditingController();
  final socialController = TextEditingController();

  String _value = "Person";
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;
  bool selected7 = false;
  bool selected8 = false;
  bool selected9 = false;
  bool selected10 = false;
  bool selected11 = false;

  var themeEmployer = Theme(
    // Create a unique theme with `ThemeData`
    data: ThemeData(
        primaryColor: Color(0xff03dac6)
    ),
    child: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  );
  //lista de objetos ChatMessage para ir agregando los mensajes cronologicmente
      // NEW

  //Para poner de nuevo el cursor en el chat despues de enviar un mensaje
  final FocusNode _focusNode = FocusNode();

  late  String area = "";

  late  String interest = "";
  late  String interest2 = "";
  late  String interest3 = "";
  late  String interest4 = "";
  late  String interest5 = "";
  late  String interest6 = "";


  //esta clase se llama en _buildTextComposer y limpair el input field una vez que se apreiete el  submitted
  void _handleSubmitted(String text, String description, String duration) {
    _textController.clear();




    //metodo para ponerl el enfoque donde debe de ser despues de que se haya hecho submit
    _focusNode.requestFocus();


  }

  void _employeeFeed() async {
    Navigator.of(context).push(
      //widget de builder para abrir nueva pagina al hacer push al stack de navegacion
      MaterialPageRoute(
        builder: (context) {


          //estructura de la pagina
          return feedEmployee();
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Register as an Employee"),
      ),
      body: Center(

        child: Expanded(
          child: Container(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Fill the following fields ',
                ),

                

                //flexible es un widget que permitira que lo ue este dentro se ajuste, es decir el controllador de texto y el boton
                Expanded(              // NEW
                  //Widget para inout del texto
                  child: TextField(
                    //se indica el controlador de texto definido antes
                    controller: _textController,
                    //al darle return se llamaria a este metodo
                    //onSubmitted: _handleSubmitted,
                    //style -> hara que el chat se ajuste al margen del celular y asi

                    decoration:
                    const InputDecoration.collapsed(hintText: 'Name of employee'),

                  ),
                ),

                Expanded(              // NEW
                  //Widget para inout del texto
                  child: TextField(
                    //se indica el controlador de texto definido antes
                    controller: yearController,
                    //al darle return se llamaria a este metodo
                    //onSubmitted: _handleSubmitted,
                    //style -> hara que el chat se ajuste al margen del celular y asi

                    decoration:
                    const InputDecoration.collapsed(hintText: 'Years of experience'),

                  ),
                ),

                Expanded(              // NEW
                  //Widget para inout del texto
                  child: TextField(
                    //se indica el controlador de texto definido antes
                    controller: experienceController,
                    //al darle return se llamaria a este metodo
                    //onSubmitted: _handleSubmitted,
                    //style -> hara que el chat se ajuste al margen del celular y asi

                    decoration:
                    const InputDecoration.collapsed(hintText: 'Describe briefly your work experience'),

                  ),
                ),

                Expanded(              // NEW
                  //Widget para inout del texto
                  child: TextField(
                    //se indica el controlador de texto definido antes
                    controller: socialController,
                    //al darle return se llamaria a este metodo
                    //onSubmitted: _handleSubmitted,
                    //style -> hara que el chat se ajuste al margen del celular y asi

                    decoration:
                    const InputDecoration.collapsed(hintText: 'Enter the URL to any social media profile of yours'),

                  ),
                ),






                //Categories
                Expanded(

                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Select your areas of interest"),


                      Expanded(
                        child: FilterChip(
                            label: Text("Home Services"),
                            selected: selected1,
                            onSelected: (bool value){
                              interest = 'Home Services';
                              selected1 = value;
                              setState(() {

                              });
                        },
                    ),
                      ),

                    Expanded(
                      child: FilterChip(
                            label: Text("Restaurants, Hospitality, and Entertainment"),
                            selected: selected2,
                            onSelected: (bool value){
                              interest2 = 'Restaurants, Hospitality, and Entertainment';
                              selected2 = value;
                              setState(() {

                              });
                        },
                      ),
                    ),

                      Expanded(
                        child: FilterChip(
                          label: Text("Driving Services"),
                          selected: selected3,
                          onSelected: (bool value){
                            interest3 = 'Driving Servicest';
                            selected3 = value;
                            setState(() {

                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: FilterChip(
                          label: Text("Healthcare"),
                          selected: selected4,
                          onSelected: (bool value){
                            interest4 = 'Healthcare';
                            selected4 = value;
                            setState(() {

                            });
                          },
                        ),
                      ),



                    Expanded(
                      child: FilterChip(
                            label: Text("Personal Assistance"),
                            selected: selected5,
                            onSelected: (bool value){
                              interest5 = 'Personal Assistance';
                              selected5 = value;
                              setState(() {

                              });
                        },
                      ),
                    ),

                      Expanded(
                        child: FilterChip(
                          label: Text("Construction Services"),
                          selected: selected6,
                          onSelected: (bool value){
                            interest6 = 'Construction Services';
                            selected6 = value;
                            setState(() {

                            });
                          },
                        ),
                      ),




                    ],
                  ),

                ),


                //Ciudad
                Expanded(

                  child: Row(
                    children: [
                      Text("Select cities of interest"),

                      Expanded(
                        child: FilterChip(
                            label: Text("Mexico City"),
                            selected: selected7,
                            onSelected: (bool value){
                              area = 'Mexico City';
                              selected7 = value;
                              setState(() {

                              });
                        },
                    ),
                      ),

                      Expanded(
                        child: FilterChip(
                          label: Text("Toluca"),
                          selected: selected8,
                          onSelected: (bool value){
                            area = 'Toluca';
                            selected8 = value;
                            setState(() {

                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: FilterChip(
                          label: Text("Cuernavaca"),
                          selected: selected9,
                          onSelected: (bool value){
                            area = 'Cuernavaca';
                            selected9 = value;
                            setState(() {

                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: FilterChip(
                          label: Text("Puebla"),
                          selected: selected10,
                          onSelected: (bool value){
                            area = 'Puebla';
                            selected10 = value;
                            setState(() {

                            });
                          },
                        ),
                      ),


                      Expanded(
                        child: FilterChip(
                          label: Text("Guadalajara"),
                          selected: selected11,
                          onSelected: (bool value){
                            area = 'Guadalajara';
                            selected11 = value;
                            setState(() {

                            });
                          },
                        ),
                      ),




                    ],
                  ),
                ),

                Expanded(
                    child: Row(
                        children: const [

                          Text("Upload files that can evidence some of your past jobs")
                          //ImageCapture()

                        ]//children
                    )
                ),


                FloatingActionButton.extended(
                  backgroundColor: const Color(0xff03dac6),
                  foregroundColor: Colors.black,
                  onPressed: () => {
                    _employeeFeed(),
                    sendEmployeeData(
                      //String name, String experience, String years,String location, String socials, String interest
                      _textController.text, experienceController.text , yearController.text ,area, socialController.text, interest,interest2, interest3, interest4, interest5, interest6 )
                  },
                  icon: Icon(Icons.add),
                  label: Text('CREATE PROFILE'),
                )







              ],
            ),
          ),
        ),
      ),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<http.Response> sendEmployeeData(String name, String experience, String years,String location, String socials, String interest,String interest2, String interest3, String interest4, String interest5, String interest6   ) {
  return http.post(
    Uri.parse('http://localhost:3000/employee?name='+name+'&'+'experience='+experience+'&'+'years='+years+'&'+'location='+location+'&'+'socials='+socials +'&'+'category='+interest +'&'+'category2='+interest2  +'&'+'category3='+interest3  +'&'+'category4='+interest4  +'&'+'category5='+interest5  +'&'+'category6='+interest6   ))
    
  ;
}



}