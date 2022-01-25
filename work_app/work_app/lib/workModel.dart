import 'dart:html';

const keyId = 'idjobs';
const keyName = 'name';
const keyDesc = 'description';
const keyWork = 'worker_num';
const keyLoca = 'location';
const keyCate = 'category';

class WorkModel {
  int idJob = 0;
  String name = '';
  String description = '';
  int workerNum = 0;
  String location = '';
  String categoria = '';

 WorkModel() {
    this.name = 'Servicio no disponible';
  }

  WorkModel.fromJSON(Map<String, dynamic> json) {
    this.idJob = json[keyId];
    this.name = json[keyName];
    this.description = json[keyDesc];
    this.workerNum = json[keyWork];
    this.location = json[keyLoca];
    this.categoria = json[keyCate];
  }
  }
