import 'categoryCard.dart';
import 'categoryScreenE.dart';
import 'category_model.dart';
import 'db_controller.dart';
import 'package:flutter/material.dart';

class categoriesFeed extends StatefulWidget {
  const categoriesFeed({
    Key? key,
    required this.userType
  }) : super(key: key);

  final String userType;

  @override
  _categoriesFeedState createState() => _categoriesFeedState(userType: this.userType);
}

class _categoriesFeedState extends State<categoriesFeed> {
  DatabaseController dbController = DatabaseController();
  late Future<List<CategoryModel>> categories;
  String userType = "";


  _categoriesFeedState({required this.userType}) : super();

  @override
  void initState() {
    super.initState();
    categories = fetchCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categories,
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> categorias) {
          if (categorias.hasData) {
            return ListView.builder(
                itemCount: categorias.data!.length,
                itemBuilder: (BuildContext context, int position) {
                  return CategoryCard(
                    category: categorias.data![position],
                    onPress: (categoryName) {

                      if (userType == "employee")
                     { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                  categoria: categorias.data![position].name,
                                  userType: "employee"
                                  )
                                  )
                                  );
                      }else{

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                  categoria: categorias.data![position].name,
                                  userType: "employer"
                                  )
                                  )
                                  );
                        

                      }
                    
                    
                    },
                  );
                });
          } else
            return CircularProgressIndicator();
        });
  }

  Future<List<CategoryModel>> fetchCategorias() async {
    return await dbController.getCategories() as List<CategoryModel>;
  }
}
