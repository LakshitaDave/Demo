import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/rounded_btn.dart';

class ThirdScreen extends StatefulWidget {
  final String t;
  const ThirdScreen({super.key,
    required this.t,
  });

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Center(
            child: ElevatedButton(
                onPressed: (){
              Navigator.pop(context);
            }, child:  Text(widget.t,style: const TextStyle(fontSize: 25.0),)),
        ),
          const SizedBox(height: 20.0,),
           Container(
             width: 150.0,
             child: RoundedBtn(
               btnName: 'Play',
               // icon: const Icon(Icons.play_arrow)
               callBack: (){
              print('Played');
                       },),
           ),


    ]

      ),
    );
  }


}
