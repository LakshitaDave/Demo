import 'package:flutter/material.dart';
import 'package:demo/screen/third.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  final String description;

  const SecondScreen({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  // Load counter value from shared preferences
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  // Save counter value to shared preferences
  _saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _counter);
  }

  // Increment counter and save the new value
  void _incrementCounter() {
    setState(() {
      _counter++;
      _saveCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Second Screen"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,


      body:  Center(
        child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children : [

            const Text('Hello ', style: TextStyle(fontSize: 30.0),),
            ElevatedButton(
                onPressed:(){
                    Navigator.pop(context);
                },
                child: Text(widget.name,style: const TextStyle(fontSize: 20.0),)),
              Text(widget.description,style: const TextStyle(fontSize: 20.0),),
              const SizedBox(height: 50.0,),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/third');
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context)=>const ThirdScreen(t:'Hello this is last screen'))
                // );
              },
                  child: const Text('Next',style: TextStyle(fontSize: 20.0),)),
              const SizedBox(height: 20.0,),

              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
              ),


            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),


    );
  }


}
