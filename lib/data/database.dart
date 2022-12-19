import 'package:hive_flutter/hive_flutter.dart';

class ReMinderDataBase{
  List reMinderList = [];
  final _myBox = Hive.box("mybox");

  void createInitialData()
  {
    reMinderList = [
      ["Make Tutorial",false],
      ["Do Exercise",false],
    ];
  }

  void loadData(){
    reMinderList = _myBox.get("REMINDERLIST");
  }
  void updateDataBase(){
    _myBox.put("REMINDERLIST", reMinderList);
  }
}