import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

Color color1=Colors.blueAccent;

Color color2=Colors.cyan;
  Timer? _timer;
  int _totaltime = 0;

  void startTimer() {
    _totaltime=0;
      const duration = const Duration(milliseconds: 100);
    _timer = new Timer.periodic(duration, (Timer timer) {
      setState(() {
        _totaltime++;
      });
    }
    );
  }
  void stopTimer(){
    _timer?.cancel();

  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("onTapDown & onTapUP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Total Time == $_totaltime",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          const SizedBox(height: 50,),
          Center(
            child: GestureDetector(
             onTapDown: (TapDownDetails details){
               setState(() {
                 color1=Colors.red;
                 color2=Colors.orange;
               });
               startTimer();
               },
              onTapUp: (TapUpDetails details){
                setState(() {
                  color1=Colors.blueAccent;
                  color2=Colors.cyan;
                });
               stopTimer();
               },
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                 gradient:  LinearGradient(
                   colors: [
                     color1,
                     color2
                   ]
                 )

                ),
                alignment: Alignment.center,
                child:const  Text("Tap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ),
          ),
        ],
      ),
    );
  }
  showGestsureTap(){
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 200),
      content: const Text('Gesture OnTap Pressed'),
      action: SnackBarAction(

        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showGestureDoubleTap(){
    Fluttertoast.showToast(
        msg: "Gesture DoubleTap Pressed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}


