import 'package:flutter/material.dart';

import 'linear_percent.dart';

class LinearIndicator extends StatefulWidget {
  const LinearIndicator({Key? key}) : super(key: key);

  @override
  State<LinearIndicator> createState() => _LinearIndicatorState();
}

class _LinearIndicatorState extends State<LinearIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: 200,
            height: 90,
            alignment: Alignment.center,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 5000),
              tween: Tween(begin: 0.0, end: 0.8),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: value * 100),
                      child: Column(
                        children: const [
                          Text(
                            "86",
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 14.0,
                      percent: value,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                      alignment: MainAxisAlignment.center,
                    ),
                  ],
                );
              },
            ),
          ),
          AnimatedSlide(
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              offset: const Offset(2, 3),
              duration: const Duration(milliseconds: 10000)),
          AnimatedRotation(
            turns: -3,
            duration: const Duration(milliseconds: 500),
            child: InkWell(
              child: Container(
                color: Colors.red,
                height: 100,
              ),
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => LinearPercent()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
