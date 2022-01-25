const keyname = 'category';
const keycount = 'COUNT(category)';

class CategoryModel {
    String name = 'Categoría no disponible';
    int count = 0;

    CategoryModel.fromJSON(Map<String, dynamic> json){
        this.name = json[keyname];
        this.count = json[keycount];
    }
}