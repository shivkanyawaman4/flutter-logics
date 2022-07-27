// import 'package:drawing_animation/drawing_animation.dart';
// import 'package:flutter/material.dart';

// class DrawingAnimation extends StatefulWidget {
//   @override
//   _DrawingAnimationState createState() => _DrawingAnimationState();
// }

// class _DrawingAnimationState extends State<DrawingAnimation> {
//   bool run = true;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//           onPressed: () => setState(() {
//                 run = !run;
//               }),
//           child: Icon((run) ? Icons.stop : Icons.play_arrow)),
//       body: Center(
//           child: Column(children: <Widget>[
//         //Simplfied AnimatedDrawing using Flutter Path objects
//         AnimatedDrawing.paths(
//           [
//             // (Path()
//             //       ..addOval(Rect.fromCircle(center: Offset.zero, radius: 30.0)))
//             //     .transform(Matrix4.rotationX(-pi)
//             //         .storage), //A circle which is slightly rotated
//             getPath(MediaQuery.of(context).size),
//           ],
//           paints: [
//             Paint()..style = PaintingStyle.stroke,
//           ],
//           run: run,
//           animationOrder: PathOrders.original,
//           duration: const Duration(seconds: 2),
//           lineAnimation: LineAnimation.oneByOne,
//           animationCurve: Curves.linear,
//           onFinish: () => setState(() {
//             run = false;
//           }),
//         ),
      
//         //Simplfied AnimatedDrawing parsing Path objects from an Svg asset
//         // Expanded(
//         //     child: AnimatedDrawing.svg(
//         //   "assets/Gmail.svg",
//         //   run: run,
//         //   duration: const Duration(seconds: 2),
//         //   lineAnimation: LineAnimation.oneByOne,
//         //   animationCurve: Curves.linear,
//         //   onFinish: () => setState(() {
//         //     run = false;
//         //   }),
//         // )),
//       ])),
//     );
//   }

//   Path getPath(Size size) {
//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.4361511, size.height * 0.01749715);
//     path_0.cubicTo(
//         size.width * 0.4729722,
//         size.height * -0.001914390,
//         size.width * 0.5185033,
//         size.height * -0.002171765,
//         size.width * 0.5555944,
//         size.height * 0.01682200);
//     path_0.lineTo(size.width * 0.9313222, size.height * 0.2092345);
//     path_0.cubicTo(
//         size.width * 0.9684111,
//         size.height * 0.2282285,
//         size.width * 0.9914222,
//         size.height * 0.2635875,
//         size.width * 0.9916944,
//         size.height * 0.3019930);
//     path_0.lineTo(size.width * 0.9944056, size.height * 0.6910500);
//     path_0.cubicTo(
//         size.width * 0.9946722,
//         size.height * 0.7294550,
//         size.width * 0.9721556,
//         size.height * 0.7650700,
//         size.width * 0.9353333,
//         size.height * 0.7844850);
//     path_0.lineTo(size.width * 0.5623222, size.height * 0.9811300);
//     path_0.cubicTo(
//         size.width * 0.5255006,
//         size.height * 1.000540,
//         size.width * 0.4799694,
//         size.height * 1.000795,
//         size.width * 0.4428800,
//         size.height * 0.9818050);
//     path_0.lineTo(size.width * 0.06715222, size.height * 0.7893900);
//     path_0.cubicTo(
//         size.width * 0.03006256,
//         size.height * 0.7703950,
//         size.width * 0.007049333,
//         size.height * 0.7350400,
//         size.width * 0.006781333,
//         size.height * 0.6966300);
//     path_0.lineTo(size.width * 0.004066478, size.height * 0.3075750);
//     path_0.cubicTo(
//         size.width * 0.003798483,
//         size.height * 0.2691700,
//         size.width * 0.02631639,
//         size.height * 0.2335535,
//         size.width * 0.06313778,
//         size.height * 0.2141420);
//     path_0.lineTo(size.width * 0.4361511, size.height * 0.01749715);
//     path_0.close();
//     return path_0;
//   }
// }
