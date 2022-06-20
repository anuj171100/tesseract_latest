import 'package:flutter/material.dart';
//import 'dart:async';

//import 'package:flutter/services.dart';
import 'package:tesseract_latest/tesseract_latest.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _scanning = false;
  String _extractText = '';
  int _scanTime = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Tesseract Implementation'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('Select image'),
                      onPressed: () async {
                        var result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          //type: FileType.custom,
                          //allowedExtensions: ['jpg', 'jpeg'],
                          //allowed extension to choose
                        );
                        setState(() {
                          _scanning = true;
                        });

                        var watch = Stopwatch()..start();
                        _extractText = await TesseractLatest.extractText(
                            result!.files.single.path!);
                        _scanTime = watch.elapsedMilliseconds;

                        setState(() {
                          _scanning = false;
                        });
                      },
                    ),
                    // It doesn't spin, because scanning hangs thread for now
                    _scanning
                        ? const SpinKitCircle(
                            color: Colors.green,
                          )
                        : const Icon(Icons.done),

                    const SizedBox(height: 16),
                    Text(
                      'Scanning took $_scanTime ms',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    Center(child: SelectableText(_extractText)),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
