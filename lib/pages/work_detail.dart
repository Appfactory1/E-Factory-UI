import 'package:app_shoe_shop/constants/constants.dart';
import 'package:app_shoe_shop/firebase/firestore.dart';
import 'package:app_shoe_shop/firebase/storage.dart';
import 'package:app_shoe_shop/models/job.dart';
import 'package:app_shoe_shop/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  MyCustomForm({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  //temp
  final Firestore tempfb = Firestore.instance;
  String username;
  String workername;

  List<String> urls = [];
  FlutterAudioRecorder _recorder;
  Recording _current;
  io.File _file;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  String address;
  String detail;
  String desc;
  List<File> imageFile;
  int temp = -1;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                labelText: "Address",
                hintText: "Enter Address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.home_filled),
              ),
              onChanged: (val) => address = val,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Container(
              height: 170,
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                maxLines: 15,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: outlineInputBorder(),
                  focusedBorder: outlineInputBorder(),
                  enabledBorder: outlineInputBorder(),
                  labelText: "Description",
                  hintText: "Enter info about the problem...",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (val) => detail = val,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 270,
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        buildGridView(),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.blue,
                          onPressed: loadAssets,
                          child: Text(
                            "Pick Images",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FlatButton(
                            onPressed: () {
                              switch (_currentStatus) {
                                case RecordingStatus.Initialized:
                                  {
                                    _start();
                                    break;
                                  }
                                case RecordingStatus.Recording:
                                  {
                                    _pause();
                                    break;
                                  }
                                case RecordingStatus.Paused:
                                  {
                                    _resume();
                                    break;
                                  }
                                case RecordingStatus.Stopped:
                                  {
                                    _init();
                                    break;
                                  }
                                default:
                                  break;
                              }
                            },
                            child: _buildText(_currentStatus),
                            color: Colors.lightBlue,
                          ),
                          new FlatButton(
                            onPressed: _currentStatus != RecordingStatus.Unset
                                ? _stop
                                : null,
                            child: new Text("Stop",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          new FlatButton(
                            onPressed: onPlayAudio,
                            child: new Text("Play",
                                style: TextStyle(color: Colors.white)),
                            color: Colors.blueAccent.withOpacity(0.5),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          // SoundPlayerUI.fromTrack(track),
          // SoundRecorderUI(track2),

          // only temporary

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                labelText: "Worker Name",
                hintText: "Enter Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.home_filled),
              ),
              onChanged: (val) => workername = val,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                labelText: "User Name",
                hintText: "Enter Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.home_filled),
              ),
              onChanged: (val) => username = val,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          // only temporary

          SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8, top: 16),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.blue,
              onPressed: () async {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  // Scaffold.of(context)
                  //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                  // Api("job").addDocument({"add": address});
                  urls = await addimages(images);
                  print(urls);
                  // String s = await StorageApi(path: "images").addImage(
                  //     (await images[0].getByteData()).buffer.asUint8List());
                  // print(s);
                  print('done');
                  String s = await StorageApi(path: "sound")
                      .addSound(_file.readAsBytesSync());
                  print('$s+sound');
                  Job j = Job(
                      detail: detail, sound: s, images: urls, address: address);

                  String uid = await Api("job").addDocumentGetId(j.toJson());
                  print(uid);

                  // temp
                  QuerySnapshot u = await tempfb
                      .collection("user")
                      .where("name", isEqualTo: username)
                      .getDocuments();

                  print(u.documents[0].documentID);
                  await tempfb
                      .collection("user")
                      .document(u.documents[0].documentID)
                      .collection('job')
                      .document(uid)
                      .setData({"date": "1"});
                  QuerySnapshot w = await tempfb
                      .collection("user")
                      .where("name", isEqualTo: workername)
                      .getDocuments();

                  print(u.documents[0].documentID);
                  await tempfb
                      .collection("user")
                      .document(u.documents[0].documentID)
                      .collection('job')
                      .document(uid)
                      .setData({"date": "1"});
                  // temp
                }
              },
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _init() async {
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        String customPath = '/E_factory';
        io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await _recorder.initialized;
        // after initialization
        var current = await _recorder.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current.status;
          print("here");
          print(_current.status);
          print(_currentStatus);
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
    print(_current.path + '  path');
  }

  _start() async {
    try {
      await _recorder.start();
      var recording = await _recorder.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = _current.status;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  _resume() async {
    await _recorder.resume();
    setState(() {});
  }

  _pause() async {
    await _recorder.pause();
    setState(() {});
  }

  _stop() async {
    var result = await _recorder.stop();
    print("Stop recording: ${result.path}");
    print("Stop recording: ${result.duration}");
    File file = widget.localFileSystem.file(result.path);
    _file = io.File(result.path);

    print("File length: ${await _file.length()}");
    setState(() {
      _current = result;
      _currentStatus = _current.status;
    });
  }

  Widget _buildText(RecordingStatus status) {
    var text = "";
    switch (_currentStatus) {
      case RecordingStatus.Initialized:
        {
          text = 'Start';
          break;
        }
      case RecordingStatus.Recording:
        {
          text = 'Pause';
          break;
        }
      case RecordingStatus.Paused:
        {
          text = 'Resume';
          break;
        }
      case RecordingStatus.Stopped:
        {
          text = 'Init';
          break;
        }
      default:
        text = "null";
        break;
    }
    return Text(text);
  }

  void onPlayAudio() async {
    print("some");
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(_current.path, isLocal: true);
  }

  Widget buildGridView() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: images.length <= 1 ? 1 : 2,
      children: images.length == 0
          ? [
              Center(
                child: Text("Add Images here"),
              )
            ]
          : List.generate(images.length, (index) {
              Asset asset = images[index];
              return AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              );
            }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  compressImage(imageFile) async {
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;
    // Im.Image imageFileReady = Im.decodeImage(imageFile.getByteData());
    // final compressedImageFile = io.File('$path.jpg')
    //   ..writeAsBytesSync(Im.encodeJpg(imageFileReady, quality: 85));
    // // setState(() {
    // //   imageFile = compressedImageFile;
    // // });
    // return compressedImageFile;
    final byteData = await rootBundle.load(imageFile.identifier);
    print(byteData);
    final file = io.File('${(await getTemporaryDirectory()).path}');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
    // File tempFile = io.File(filePath);
    // return tempFile;
  }

  Future<List<String>> addimages(imgs) async {
    List<String> url = [];
    for (int i = 0; i < imgs.length; i++) {
      temp += 1;
      url.add(await StorageApi(path: "images/$temp")
          .addImage((await imgs[i].getByteData()).buffer.asUint8List()));
    }

    return url;
  }
}
