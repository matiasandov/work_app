import 'dart:html';

const keyId = 'idemployees';
const keyName = 'name';
const keyExpe = 'experience';
const keyYear = 'years';
const keyLoca = 'location';
const keySoci = 'socials';
const keyCate = 'category';
const keyCate2 = 'category2';
const keyCate3 = 'category3';
const keyCate4 = 'category4';
const keyCate5 = 'category5';
const keyCate6 = 'category6';

class EmployeeModel {
  int idemployees = 0;
  String name = '';
  String experience = '';
  int years = 0;
  String location = '';
  String socials = '';
  String category = '';
  String category2 = '';
  String category3 = '';
  String category4 = '';
  String category5 = '';
  String category6 = '';

 EmployeeModel() {
    this.name = 'Servicio no disponible';
  }

  EmployeeModel.fromJSON(Map<String, dynamic> json) {
    this.idemployees = json[keyId];
    this.name = json[keyName];
    this.experience = json[keyExpe];
    this.years = json[keyYear];
    this.location = json[keyLoca];
    this.socials = json[keySoci];
    this.category = json[keyCate];
    this.category2 = json[keyCate2];
    this.category3 = json[keyCate3];
    this.category4 = json[keyCate4];
    this.category5 = json[keyCate5];
    this.category6 = json[keyCate6];
  }
  }