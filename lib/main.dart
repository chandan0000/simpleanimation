import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<Offset> slideAnimation;
  late AnimationController slideAnimationController;
  @override
  void initState() {
    super.initState();

    slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimation = Tween(begin: const Offset(-2, 0), end: const Offset(0, 0))
        .animate(slideAnimationController.view);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                  position: slideAnimation,
                  // scale: fadeAnimation,
                  // opacity: fadeAnimation,
                  child: Container(width: 200, height: 200, color: Colors.red)),
              ElevatedButton(
                onPressed: () {
                  slideAnimationController.forward();
                },
                child: const Text("Show"),
              ),
              ElevatedButton(
                onPressed: () {
                  slideAnimationController.reverse();
                },
                child: const Text("Hide"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   late Animation<Offset> fadeAnimation;
//   late AnimationController fadeAnimationController;
//   @override
//   void initState() {
//     super.initState();

//     fadeAnimationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     fadeAnimation =
//         Tween(begin: 0.0, end: 1.0).animate(fadeAnimationController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SlideTransition(

//                   // scale: fadeAnimation,
//                   // opacity: fadeAnimation,
//                   child: Container(width: 200, height: 200, color: Colors.red)),
//               ElevatedButton(
//                 onPressed: () {
//                   fadeAnimationController.forward();
//                 },
//                 child: const Text("Show"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   fadeAnimationController.reverse();
//                 },
//                 child: const Text("Hide"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
