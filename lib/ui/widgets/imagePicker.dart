import 'package:e_afferai/ui/pages/add_product.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class imgePicker extends StatefulWidget {
  const imgePicker({Key? key}) : super(key: key);

  @override
  State<imgePicker> createState() => _imgePickerState();
}

class _imgePickerState extends State<imgePicker> {

  File? _file;
  Future pickerCamera() async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            // child: _file == null ? Image.asset('assets/icon1.jpg', height: 180, width: 180) : Image.file(_file!, height: 180, width: 180),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 90.0,
              backgroundImage: _file == null
                  ? AssetImage("assets/roue.jpg") as ImageProvider
                  : FileImage(File(_file!.path)) as ImageProvider,
            ),
          ),  
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 8, 0),
                child: Center(child: Text('Part Picture')),
              ),
              Center(
                  child: IconButton(
                      onPressed: pickerCamera,
                      icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 36,
                          color: Color(0xff93B8EF)
                      )
                  )
              ),
            ],
          ),
        ],
    );
  }
}
