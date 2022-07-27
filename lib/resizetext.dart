import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double wid1 =
      -1; //Being I used null safety, I initialized these with a random value;
  double maxDx = 0,
      textSize = 20,
      prevDx = 0,
      tmpSize = 0,
      minSize = 15,
      maxSize = 100;

  @override
  Widget build(BuildContext context) {
    if (wid1 == -1) {
      maxDx = MediaQuery.of(context).size.width;
      wid1 = maxDx / 2;
    }

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 300,
            child: Stack(children: [
              Positioned(
                  left: wid1,
                  right:1,
                  child: GestureDetector(
                      onHorizontalDragDown: (d) {
                        prevDx = d.globalPosition.dx;
                      },
                      onHorizontalDragUpdate: (d) {
                        if (d.globalPosition.dx < maxDx - 50 &&
                            d.globalPosition.dx > 50) {
                          setState(() {
                            tmpSize = prevDx - wid1;
                            wid1 = d.globalPosition.dx;
                            if (tmpSize > minSize && tmpSize < maxSize) {
                              textSize = tmpSize;
                            } else if (tmpSize < minSize) {
                              textSize = minSize;
                            } else if (tmpSize > maxSize) {
                              textSize = maxSize;
                            }
                          });
                        }
                      },

                      // onPanDown: (d) {
                      //   prevDx = d.globalPosition.dx;
                      // },
                      // onPanUpdate: (d) {
                      //   if (d.globalPosition.dx < maxDx - 50 &&
                      //       d.globalPosition.dx > 50) {
                      //     setState(() {
                      //       tmpSize = prevDx - wid1;
                      //       wid1 = d.globalPosition.dx;
                      //       if (tmpSize > minSize && tmpSize < maxSize) {
                      //         textSize = tmpSize;
                      //       } else if (tmpSize < minSize) {
                      //         textSize = minSize;
                      //       } else if (tmpSize > maxSize) {
                      //         textSize = maxSize;
                      //       }
                      //     });
                      //  }
                      // },
                      child: Container(
                        width: maxDx - wid1 - 15,
                        color: Colors.green,
                        child: Text('View 2',
                            style: TextStyle(
                                color: Colors.black, fontSize: textSize)),
                      ))),
            ])),
      ],
    ));
  }
}
