import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  final TextEditingController _hisname = TextEditingController();
  final TextEditingController _hername = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void reset() {
    setState(() {
      _hisname.text = "";
      _hername.text = "";
    });
  }

  Timer? _timer;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Image.network(
          //   'https://images.unsplash.com/photo-1521033719794-41049d18b8d4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fGxvdmV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          //   height: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                margin: const EdgeInsets.only(left: 250),
                child: Image.asset(
                  'assets/shape.png',
                  height: 75,
                  width: 75,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2)),
                child: TextField(
                  controller: _hisname,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.male),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                      hintText: "HIS NAME",
                      contentPadding: EdgeInsets.only(left: 20, top: 12),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2)),
                child: TextField(
                  controller: _hername,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.female),
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          fontSize: 18),
                      hintText: "HER NAME",
                      contentPadding: EdgeInsets.only(left: 20, top: 12),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(right: 250),
                child: Image.asset(
                  'assets/sh.png',
                  height: 75,
                  width: 75,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () => press(),
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade400,
                      borderRadius: BorderRadius.circular(25),
                      border:
                          Border.all(width: 2, color: Colors.pink.shade200)),
                  child: const Text(
                    "Ask Cupid",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 0.67),
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            builder: (context, value, _) => SizedBox(
                              height: 100,
                              child: LiquidCustomProgressIndicator(
                                direction: Axis.horizontal,
                                shapePath: _buildHeartPath(context),
                                center: Text(
                                  '${23.toStringAsFixed(0)}%',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.redAccent.withOpacity(0.2)),
                                value: value,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0.0, end: 0.59),
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(milliseconds: 3000),
                              builder: (context, value, _) =>
                                  LiquidCustomProgressIndicator(
                                direction: Axis.horizontal,
                                shapePath: _buildHeartPath(context),
                                center: Text(
                                  '${23.toStringAsFixed(0)}%',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.redAccent.withOpacity(0.5)),
                                value: value,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: _progress == 0.0 ? 0 : 100,
                width: _progress == 0.0 ? 0 : 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.pink.shade200)),
                child: Center(
                  child: Text(
                    '${_progress.toStringAsFixed(0)}%',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  Path _buildHeartPath(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.6226415);
    path_0.cubicTo(size.width, size.height * 0.8310509, size.width * 0.9712090,
        size.height, size.width * 0.9356913, size.height);
    path_0.lineTo(size.width * 0.06430868, size.height);
    path_0.cubicTo(size.width * 0.02879199, size.height, 0,
        size.height * 0.8310509, 0, size.height * 0.6226415);
    path_0.lineTo(0, 0);
    path_0.close();
    return path_0;
  }

  num loveCalculator({required String hisName, required String herName}) {
    // String name1 = "asha";
    // String name2 = "asha";

    num sum1 = addValue(hisName);
    num sum2 = addValue(herName);
    num loveCalsi = 0;

    if (sum1 >= sum2) {
      loveCalsi = (sum2 / sum1) * 100;
    } else {
      loveCalsi = (sum1 / sum2) * 100;
    }
    return loveCalsi;
  }

  num addValue(String name) {
    num result = 0;

    for (int i = 0; i < name.length; i++) {
      result += name.codeUnitAt(i);
    }
    return result;
  }

  void press() {
    final text1 = _hisname.text;
    final text2 = _hername.text;

    if (text1 != "" && text2 != "") {
      final percentage = loveCalculator(herName: text1, hisName: text2);
      _timer = Timer.periodic(const Duration(seconds: 100), (Timer timer) {
        print(percentage);
        print("progresss");
        print(_progress);
        if (_progress < 0.6) {
          print("vfvr");
          if (mounted) {
            print("jef");
            setState(() {
              _progress += 0.05;
            });
          }
        } else {
          _timer?.cancel();
          _timer = null;
        }
      });

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                children: [
                  //  ),
                  //    ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text("$text1 ❤ $text2")
                ],
              ),
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Enter The Details"),
            );
          });
    }
    reset();
  }
}
