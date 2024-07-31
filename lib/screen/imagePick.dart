import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {

  final picker = ImagePicker();
    File? _imgFile;

  Future getImage() async {

    final img = await picker.pickImage(source: ImageSource.gallery) ;
    if(img==null)return;

    setState(() {
      _imgFile = File(img.path);
    });
  }
Future captureImage() async {

    final img = await picker.pickImage(source: ImageSource.camera) ;
    if(img==null)return;
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
    else {
      setState(() {
        _imgFile = File(img.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        backgroundColor: Colors.grey,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: (){
                        getImage();
                      },
                      icon: const Icon(Icons.photo_album,size: 60,),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: (){
                        captureImage();
                      },
                      icon: const Icon(Icons.camera_alt_outlined,size: 60,),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30,),
             _imgFile != null ?
             Container(
               height: MediaQuery.of(context).size.height *0.7,
                 child: Image.file(_imgFile!)
             )
                 : const Text('Select image',style: TextStyle(fontSize: 30),),
       ]
        ),
      ),
    );
  }
}
