import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice/Hive/boxes.dart';
import 'package:practice/Hive/person.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  boxPersons = await Hive.openBox<Person>('personBox');
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name_ctrl = TextEditingController();
  var age_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    TextField(
                      controller: name_ctrl,
                      decoration: InputDecoration(hintText: 'name'),
                    ),
                    TextField(
                      controller: age_ctrl,
                      decoration: InputDecoration(hintText: 'age'),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            boxPersons.put(
                                'key_${name_ctrl.text}',
                                Person(
                                    name: name_ctrl.text,
                                    age: int.parse(age_ctrl.text)));
                            name_ctrl.clear();
                            age_ctrl.clear();
                          });
                        },
                        child: Text('Add'))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 400,
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: boxPersons.length,
                      itemBuilder: (context, index) {
                        Person person = boxPersons.getAt(index);
                        return ListTile(
                          title: Text(person.name.toUpperCase(), style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                          leading: Icon(Icons.person),
                          trailing: IconButton(onPressed: () {
                            setState(() {
                              boxPersons.deleteAt(index);
                            });
                          }, icon: Icon(Icons.delete),),
                          subtitle: Text(
                            'age:${person.age.toString()}',),
                        );
                      }),
                )),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  boxPersons.clear();
                });

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.delete), Text('Delete all')],
              ))
        ],
      )),
    );
    ;
  }
}
