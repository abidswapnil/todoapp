import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final fontstyle_1 = GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.blueGrey.shade600);
  final fontstyle_2 = GoogleFonts.oswald(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.blueGrey.shade300);
  final fontstyle_3 = GoogleFonts.oswald(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.blueGrey.shade600);

  DatabaseReference ref = FirebaseDatabase.instance.ref('folders');

  final TextEditingController _task = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> folders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        title: Text("Task Folders", style: fontstyle_1,),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Manage your tasks.",
                style: fontstyle_2,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade400,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        onPressed: (){
          addFolder();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.apps,),
              onPressed: (){},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
  void addFolder() => showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context)=> AlertDialog(
      title: Text(
        "Add a task",
        style: fontstyle_3,
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _task,
          onChanged: (value){},
          autofocus: true,
          decoration: InputDecoration(
              hintText: "Task",
              hintStyle: fontstyle_2
          ),
          validator: (value){
            if(value!.isEmpty){
              return "Add a task!";
            }
          },
        ),
      ),
        actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: (){
            Navigator. pop(context, false);
          },
        ),
        TextButton(
          child: Text("Add"),
          onPressed: (){
            if(_formKey.currentState!.validate()){
              saveTask();
              _task.clear();
              Navigator. pop(context, false);
              showFolder();
            }
          },
        ),
      ],
    ),
  );
  saveTask() {
     ref.child(_task.text).set('');
  }
  showFolder(){
    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.key;
      folders.add(data.toString());
      print(data.toString());
    });
  }
}

