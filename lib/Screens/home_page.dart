import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import '../util/dialog_Box.dart';
import '../util/reminder_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ReMinderDataBase db = ReMinderDataBase();

  @override
  void initState(){
    if ( _myBox.get("REMINDERLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
  // text controller
  final _controller = TextEditingController();
  //checkbox was tappoed
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.reMinderList[index][1] = !db.reMinderList[index][1];
    });
    db.updateDataBase();
  }
  void saveNewTask(){
    setState(() {
      db.reMinderList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  void createNewTask() {
    showDialog(context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  //delete task
  void deleteTask(int index){
    setState(() {
      db.reMinderList.removeAt(index);
    });
    db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Reminder"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.reMinderList.length,
        itemBuilder: ((context, index) {
          return ReminderTile(
            taskName: db.reMinderList[index][0],
            taskComleted:db. reMinderList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }
        ),
      ),
    );
  }
}