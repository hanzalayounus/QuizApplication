import 'package:flutter/material.dart';
import 'package:flutter_quiz/person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Quiz Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> personList = <Person>[];
  List<int> sortedList=[];


  void _incrementCounter() {
    sortedList.clear();
     for(var item in personList){
         sortedList.add(item.age!);
     }

     setState(() {
       sortedList.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    personList.clear();
    personList.add(Person("zohaib", 27));
    personList.add(Person("ahmed", 22));
    personList.add(Person("umer", 21));
    personList.add(Person("usman", 29));
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'person list',
            ),
            Container(
              height: 300,
              width: 200,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: personList.length,
                itemBuilder: (BuildContext context,int index) {
                  return ListTile(

                    title: Text(
                      personList[index].name!,
                      style: const TextStyle(
                          color: Colors.black
                      ),
                    ),
                    subtitle: Text(
                      personList[index].age.toString(),
                      style: const TextStyle(
                          color: Colors.black
                      ),
                    ),
                  );
                },
              ),
            ),


            Text(
              'Sorted List by age',
            ),

            Container(
              height: 100,
              width: 150,
              child: ListView.builder(
                  itemCount: sortedList.length,
                  scrollDirection: Axis.horizontal,
                  //scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                    Text(
                    sortedList[index].toString(),
                    )
                      ],
                    );

                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Sort',
        child: const Icon(Icons.sort),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
