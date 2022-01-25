import 'package:flutter/material.dart';
import 'category_model.dart';
import 'category_constants.dart';
import 'workDetailScreen.dart';

class CategoryCard extends StatelessWidget {
  CategoryModel category;
  Function(String cateogry) onPress;
  CategoryCard({Key? key, required this.category, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // https://api.flutter.dev/flutter/material/Card-class.html
    return Card(
        child: InkWell(
            splashColor: categoriesIconsColors[category.name],
            child: Column(children: <Widget>[
                ListTile(
                    // Aca podemos ponerle que cambie el ícono según la categor\ía maybe :O
                    leading: Icon(categoriesIcons[category.name], color: categoriesIconsColors[category.name]),
                    title: Text(category.name),
                    subtitle: Text("Servicios Disponibles: " + category.count.toString())),
            ]),
            
         onTap: () {
                onPress(category.name);
            },
        )
    );
  }
}