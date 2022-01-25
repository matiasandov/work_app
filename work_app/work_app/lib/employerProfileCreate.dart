import 'package:flutter/material.dart';
import 'package:work_app/feedEmployer.dart';
import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';
//import 'package:work_app/imageCapture.dart';

class employerCreateScreen extends StatelessWidget {
  employerCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return employerScreen();
  }
}

class employerScreen extends StatefulWidget {
  const employerScreen({Key? key}) : super(key: key);

  @override
  _employerScreenState createState() => _employerScreenState();
}

class _employerScreenState extends State<employerScreen> {
  //esto es un objeto global que manejara el texto ingresado
  final _textController = TextEditingController();
  final socialController = TextEditingController();
  String _value = "Person";

  late String area = "";

  late String interest = "";

  late String typePerson = "";

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
  bool selected12 = false;
  bool selected13 = false;

  final  themeEmployer = Theme(
    // Create a unique theme with `ThemeData`
    data: ThemeData(
        primaryColor: Color(0xff03dac6)
    ),
    child: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  );

  void _employerFeed() async {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.cyan
          ),

      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Register as an Employer"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                'Fill the following fields ',
              ),

              //flexible es un widget que permitira que lo ue este dentro se ajuste, es decir el controllador de texto y el boton
              Flexible(
                // NEW
                //Widget para inout del texto
                child: TextField(
                  //se indica el controlador de texto definido antes
                  controller: _textController,
                  //al darle return se llamaria a este metodo
                  //onSubmitted: _handleSubmitted,
                  //style -> hara que el chat se ajuste al margen del celular y asi

                  decoration: const InputDecoration.collapsed(
                      hintText: 'Name of employer'),

                  //Para poner el cursor de nuevo en este mismo widget
                  //focusNode: _focusNode,
                ),
              ),

              Flexible(
                // NEW
                //Widget para inout del texto
                child: TextField(
                  //se indica el controlador de texto definido antes
                  controller: _textController,
                  //al darle return se llamaria a este metodo
                  //onSubmitted: _handleSubmitted,
                  //style -> hara que el chat se ajuste al margen del celular y asi

                  decoration: const InputDecoration.collapsed(
                      hintText: 'Describe your business briefly'),

                  //Para poner el cursor de nuevo en este mismo widget
                  //focusNode: _focusNode,
                ),
              ),

              //Ciudad
              Flexible(
                child: Row(
                  children: [
                    Text("Select areas of interest for your business"),
                    Expanded(
                      child: FilterChip(
                        label: Text("Home Services"),
                        selected: selected1,
                        onSelected: (bool value) {
                          interest = 'Home Services';
                          selected1 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Restaurants, Hospitality, and Entertainment"),
                        selected: selected2,
                        onSelected: (bool value) {
                          interest = 'Restaurants, Hospitality, and Entertainment';
                          selected2 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Driving Services"),
                        selected: selected3,
                        onSelected: (bool value) {
                          interest = 'Driving Servicest';
                          selected3 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Healthcare"),
                        selected: selected4,
                        onSelected: (bool value) {
                          interest = 'Healthcare';
                          selected4 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Personal Assistance"),
                        selected: selected5,
                        onSelected: (bool value) {
                          interest = 'Personal Assistance';
                          selected5 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Construction Services"),
                        selected: selected6,
                        onSelected: (bool value) {
                          interest = 'Construction Services';
                          selected6 = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //radio
              //https://material.io/components/chips/flutter#choice-chips
              Flexible(
                child: Row(
                  children: [
                    Text("Select what applies to your case"),
                    Expanded(
                      child: FilterChip(
                        label: Text("Natural person"),
                        selected: selected12,
                        onSelected: (bool value) {
                          typePerson = 'Natural person';
                          selected12 = value;
                          setState(() {
                            selected13 = false;
                          });
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Legal Entity"),
                        selected: selected13,
                        onSelected: (bool value) {
                          typePerson = 'Legal Entity';
                          selected13 = value;
                          setState(() {
                            selected12 = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //Ciudad
              Flexible(
                child: Row(
                  children: [
                    Text("Select cities of interest"),


                    Expanded(
                      child: FilterChip(
                        label: Text("Mexico City"),
                        selected: selected7,
                        onSelected: (bool value) {
                          area = 'Mexico City';
                          selected7 = value;
                          setState(() {});
                        },
                      ),
                    ),



                    Expanded(
                      child: FilterChip(
                        label: Text("Toluca"),
                        selected: selected8,
                        onSelected: (bool value) {
                          area = 'Toluca';
                          selected8 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Cuernavaca"),
                        selected: selected9,
                        onSelected: (bool value) {
                          area = 'Cuernavaca';
                          selected9 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Puebla"),
                        selected: selected10,
                        onSelected: (bool value) {
                          area = 'Puebla';
                          selected10 = value;
                          setState(() {});
                        },
                      ),
                    ),

                    Expanded(
                      child: FilterChip(
                        label: Text("Guadalajara"),
                        selected: selected11,
                        onSelected: (bool value) {
                          area = 'Guadalajara';
                          selected11 = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Flexible(
                // NEW
                //Widget para inout del texto
                child: TextField(
                  //se indica el controlador de texto definido antes
                  controller: socialController,
                  //al darle return se llamaria a este metodo
                  //onSubmitted: _handleSubmitted,
                  //style -> hara que el chat se ajuste al margen del celular y asi

                  decoration: const InputDecoration.collapsed(
                      hintText:
                          'Enter the URL to any social media profile of yours'),
                ),
              ),

              Flexible(
                  child: Row(children: const [
                Text(
                    "Upload files that can evidence some of your past business experience (if any)")
                //ImageCapture()
              ] //children
                      )),

              FloatingActionButton.extended(
                backgroundColor: const Color(0xff03dac6),
                foregroundColor: Colors.black,
                onPressed: () => {
                  _employerFeed(),
                  //sendEmployeeData(String interests, String person_or_business, String location,String socials )
                  sendEmployeeData(
                      interest, typePerson, area, socialController.text)
                },
                icon: Icon(Icons.add),
                label: Text('CREATE PROFILE'),
              )
            ],
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  } //build

  Future<http.Response> sendEmployeeData(String interests,
      String person_or_business, String location, String socials) {
  
    return http.post(Uri.parse('http://localhost:3000/employer?interests=' +
        interests +
        '&' +
        'person_or_business=' +
        person_or_business +
        '&' +
        'location=' +
        location +
        '&' +
        'socials=' +
        socials));
  }
}
