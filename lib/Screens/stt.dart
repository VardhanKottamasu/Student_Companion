import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
class VoiceName extends StatefulWidget {
  @override
  _VoiceNameState createState() => _VoiceNameState();
}

class _VoiceNameState extends State<VoiceName> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String resultText = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeechRecognizer();
  }
  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result) {
      setState(() {
        _isAvailable = result;
      });
    });
    _speechRecognition.setRecognitionStartedHandler(() {
      setState(() {
        _isListening = true;
      });
    });
    _speechRecognition.setRecognitionResultHandler((speech) {
      setState(() {
        resultText = speech;
      });
    });
    _speechRecognition.setRecognitionCompleteHandler(() {
      setState(() {
        _isListening = false;
      });
    });
    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purpleAccent,
      title: 'Student Companion',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      if (_isListening)
                        _speechRecognition
                            .cancel()
                            .then((result) => setState(() {
                          _isListening = result;
                          resultText = '';
                        }));
                    },
                    color: Colors.red,
                    child: Icon(Icons.cancel),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_isAvailable && !_isListening)
                        _speechRecognition
                            .listen(locale: "en_US");
                    },
                    child: Icon(Icons.mic),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_isListening)
                        _speechRecognition.stop().then(
                                (result) => setState(() { _isListening = result;
                            }
                            ));
                    },
                    color: Colors.deepPurple,
                    child: Icon(Icons.stop),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent[100],
                        borderRadius: BorderRadius.circular(6.0)),
                    child: SelectableText(resultText,style: TextStyle(
                        fontSize: 30.0
                    ),),
                  ),
                  RaisedButton(onPressed: (){
                    Navigator.pop(context);
                  },
                    child: Text('Go to Home'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
