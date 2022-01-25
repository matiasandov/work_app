const keyId = 'idjobs';
const keyName = 'name';
const keyDesc = 'description';
const keyNum = 'worker_num';
const keyLoc = 'location';

class JobModel {
  int jobID = 0;
  String name = '';
  String description = '';
  int workerNum = 0;
  String location = '';

  JobModel() {
    this.name = 'Job unavailable';
  }

  JobModel.fromJSON(Map<String, dynamic> json) {
    this.jobID = json[keyId];
    this.name = json[keyName];
    this.description = json[keyDesc];
    this.workerNum = json[keyNum];
    this.location = json[keyLoc];
  }
}
