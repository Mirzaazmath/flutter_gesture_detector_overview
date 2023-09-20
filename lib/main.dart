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
  double height=60;
  double width=120;
  bool isPressed=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Long Pressed"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            showGestsureTap();
          },
          onDoubleTap: (){
            showGestureDoubleTap();
            },
          onLongPress: (){
            setState(() {
              isPressed=!isPressed;
              height=isPressed?100:60;
              width=isPressed?160:120;
            });
            },
          child: AnimatedContainer(
            duration:const  Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
             gradient: const LinearGradient(
               colors: [
                 Colors.blueAccent,
                 Colors.cyan,
               ]
             )

            ),
            alignment: Alignment.center,
            child:const  Text("Tap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          ),
        ),
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
