import 'package:flutter/material.dart';
import 'category_constants.dart';
import 'db_controller.dart';
import 'employeeModel.dart';
import 'workModel.dart';
import 'categoryCard.dart';

//Creo que deberia ser stateless, como las demas views
// Oooh creo que tienes razón

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key, 
  required this.categoria,
  required this.userType

  }) : super(key: key);
  final String categoria;
  final String userType;

  @override
  State<CategoryScreen> createState() =>
      CategoryScreenState(
        categoria: this.categoria,
        userType: this.userType
        );
}

class CategoryScreenState extends State<CategoryScreen> {
  DatabaseController dbController = DatabaseController();
  late Future<List<WorkModel>> _works;
  late Future<List<EmployeeModel>> _employees;
  String categoria = '';
  String userType = '';

  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      const Icon(Icons.star, color: Colors.black),
      const Icon(Icons.star, color: Colors.black),
    ],
  );

  CategoryScreenState({
    required this.categoria,
    required this.userType
    }) : super();

  @override
  void initState() {
    super.initState();
    
    if(userType == "employee"){
      _works = fetch_works();
    }else{
      _employees = fetch_employees();
    }
    
  }

  @override
   Widget build(BuildContext context)  {
    if (userType == "employee")
    {return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoria),
          backgroundColor: categoriesIconsColors[categoria],
        ),
        body: FutureBuilder(
            future: _works,
            builder:
                (BuildContext context, AsyncSnapshot<List<WorkModel>> _works) {
              if (_works.hasData) {
                return ListView.builder(
                    itemCount: _works.data!.length,
                    itemBuilder: (BuildContext context, int position) {
                      return Card(
                          child:
                          Column(mainAxisSize: MainAxisSize.min,
                              
                              children: <Widget>[
                                        ListTile(
                                          leading: Icon(categoriesIcons[
                                              _works.data![position].categoria]),
                                          //Center(child: new Text(
                                          title: Text(_works.data![position].name),
                                          subtitle: Text(_works.data![position].description),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Column(children: [
                                              Text('Location: '),
                                              Text(_works.data![position].location)
                                            ]),
                                            const SizedBox(width: 8),
                                            Column(children: [
                                              Text('Number of workers needed: '),
                                              Text(_works.data![position].workerNum.toString())
                                            ]),
                                            const SizedBox(width: 8),
                                          ],
                                        ),
                      ]));
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));}
            

            //EMPLOYER
            else{
              return MaterialApp(
                theme: ThemeData(
                    primarySwatch: Colors.cyan
                ),
                home: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoria),
          backgroundColor: categoriesIconsColors[categoria],
        ),
        body: FutureBuilder(
            future: _employees,
            builder:
                  (BuildContext context, AsyncSnapshot<List<EmployeeModel>> _employees) {
              
                if (_employees.hasData) {
                  return ListView.builder(
                      itemCount: _employees.data!.length,
                      itemBuilder: (BuildContext context, int position) {
                        return Card(
                            child:
                                Column(mainAxisSize: MainAxisSize.min, children: <
                                    Widget>[
                          ListTile(
                            leading: Icon(categoriesIcons[
                                _employees.data![position].category]),
                            title: Text(_employees.data![position].name),
                            subtitle: Text(_employees.data![position].experience),

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(children: [
                                Text('Years of experience: '),
                                Text(_employees.data![position].years.toString())
                              ]),
                              const SizedBox(width: 8),
                              Column(children: [
                                Text('Location: '),
                                Text(_employees.data![position].location)
                              ]),
                              const SizedBox(width: 8),

                              Column(children: [
                                Text('Rating: '),
                                stars,
                              ]),


                            ],
                          ),
                        ]));
                      });
                } else {
                  return CircularProgressIndicator();
                }
            })),
              );
            }
  }

  Future<List<WorkModel>> fetch_works() async {
    return await dbController.getJobs(this.categoria) as List<WorkModel>;
  }

  Future<List<EmployeeModel>> fetch_employees() async {
    return await dbController.getEmployees(this.categoria) as List<EmployeeModel>;
  }

}
