import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../home/home_page.dart';
import '../user/user_data.dart';

class UploadImage extends StatefulWidget {
  UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  bool _isUploading = false;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _uploadImageToCloudinary() async {
    if (_image == null) return;
    setState(() {
      _isUploading = true;
    });

    String cloudName = 'dcaufvn3n';
    String uploadPreset = 'qs0yyidb';

    final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/upload');

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', _image!.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);

      final currentUser = userData.users[userData.currentUserIndex];
      currentUser.photos.insert(0, {"url": jsonMap['public_id']});

      setState(() {
        _image = null;
        _isUploading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print('Erro ao fazer upload da imagem.');
      setState(() {
        _isUploading = false;
      });
    }
  }

  void _deleteImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova foto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null) ...[
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image.file(_image!),
                  IconButton(
                    onPressed: _deleteImage,
                    icon: Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5C0FFF)),
              ),
              child: Text('Triar uma foto'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5C0FFF)),
              ),
              child: Text('Escolher da Galeria'),
            ),
            SizedBox(height: 20),
            if (_image != null && !_isUploading) ...[
              ElevatedButton(
                onPressed: _uploadImageToCloudinary,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5C0FFF)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Upload to Cloudinary'),
              ),
            ],
            if (_isUploading) ...[
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Uploading...'),
            ],
          ],
        ),
      ),
    );
  }
}
