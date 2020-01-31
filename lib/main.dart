import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                await showCustomDialog(context: context);
              },
              child: Text('Success Animation'),
            ),
            RaisedButton(
              onPressed: () async {
                await showCustomDialog(context: context, isSuccess: false);
              },
              child: Text('Success Animation'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future showCustomDialog({BuildContext context, bool isSuccess = true}) {
    LottieController lottieController;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: Center(
                child: LottieView.fromFile(
                  filePath: isSuccess ? 'assets/check_done.json' : 'assets/check_error.json',
                  loop: false,
                  autoPlay: true,
                  onViewCreated: (controller) async {
                    lottieController = controller;
                    lottieController.setAnimationSpeed(0.7);

                    lottieController.onPlayFinished.listen((data) {
                      if(data) {
                        print('entrei');
                        lottieController.stop();
                        Navigator.pop(context);
                      }
                    });
                    
                    
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future scan() async {
    try {} catch (e) {
      print('Unknown error: $e');
    }
  }
}
