import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:work_app/employeeModel.dart';
import 'package:work_app/workModel.dart';
import 'dart:convert';
import 'dart:core';
import 'job_model.dart';
import 'category_model.dart';

class DatabaseController {
  Future<List<CategoryModel>?> getCategories() async {
    Uri uri = Uri.parse('http://localhost:3000/jobCategories');
    http.Response result = await http.get(uri);
    if (result.statusCode != HttpStatus.ok) return [];
    final jsonResponse = json.decode(result.body);
    List<CategoryModel> categories = jsonResponse
        .map<CategoryModel>((category) => CategoryModel.fromJSON(category))
        .toList();
    return categories;
  }

  Future<List<WorkModel>?> getJobs(String category) async {
    Uri uri = Uri.parse('http://localhost:3000/jobCategories/' + category);
    http.Response result = await http.get(uri);
    if (result.statusCode != HttpStatus.ok) return [];
    final jsonResponse = json.decode(result.body);
    List<WorkModel> works = jsonResponse
        .map<WorkModel>((work) => WorkModel.fromJSON(work))
        .toList();
    return works;
  }

  Future<List<CategoryModel>?> getEmployeeCat() async {
    Uri uri = Uri.parse('http://localhost:3000/employeeCategories');
    http.Response result = await http.get(uri);
    if (result.statusCode != HttpStatus.ok) return [];
    final jsonResponse = json.decode(result.body);
    List<CategoryModel> categories = jsonResponse
        .map<CategoryModel>((category) => CategoryModel.fromJSON(category))
        .toList();
    return categories;
  }
//seguro aqui va un cambio o en el index, puedo de una vez ponerle que si category? es igual a "tal" jale category1 o category3
  Future<List<EmployeeModel>?> getEmployees(String category) async {
    Uri uri = Uri.parse('http://localhost:3000/employeeCategories/' + category);

    http.Response result = await http.get(uri);
    if (result.statusCode != HttpStatus.ok) return [];
    final jsonResponse = json.decode(result.body);
    print(jsonResponse);
    List<EmployeeModel> employees = jsonResponse
        .map<EmployeeModel>((employee) => EmployeeModel.fromJSON(employee))
        .toList();
    print(employees);
    return employees;
  }
}
