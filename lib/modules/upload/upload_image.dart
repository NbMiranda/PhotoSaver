import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Upload to Cloudinary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImageToCloudinary() async {
    if (_image == null) return;

    // Replace these with your Cloudinary credentials
    String cloudName = 'dcaufvn3n';
    String apiKey = '423469859132672';
    String uploadPreset = 'ovOFCG1X_3EG0_X8WVotYqa0wR4';

    var url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
    var request = http.MultipartRequest('POST', url);

    request.fields['upload_preset'] = uploadPreset;
    request.fields['api_key'] = apiKey;
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      // Process successful upload
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var parsedJson = json.decode(responseString);
      print(parsedJson);
      // Handle the response data as needed
    } else {
      // Handle failed upload
      print('Failed to upload image: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Photo Upload to Cloudinary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Take Photo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImageToCloudinary,
              child: Text('Upload to Cloudinary'),
            ),
          ],
        ),
      ),
    );
  }
}
