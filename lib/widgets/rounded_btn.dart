import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final VoidCallback? callBack;

  const RoundedBtn({super.key,
    required this.btnName,
    this.bgColor= Colors.grey,
    this.callBack,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: (){
        callBack!();
      },
      child: icon!=null ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            icon!,
          Text(btnName,style: TextStyle(fontSize: 30.0),)
        ],
      ): Text(btnName,style: TextStyle(fontSize: 40.0),),
        style: ElevatedButton.styleFrom(
          //primary : bgColor,
          shadowColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))
          )
        ),
     );
  }
}
