import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snake_game/screens/homepage.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  static List snakePos = [45, 65, 85, 105, 125];
  static var randomNum = Random();
  int numberOfsquares = 540;
  int food = randomNum.nextInt(400);

  void generateFood() {
    food = randomNum.nextInt(500);
    while (snakePos.contains(food)) {
      food = randomNum.nextInt(500);
    }
  }

  void startGame() {
    snakePos = [45, 65, 85, 105, 125];
    const duration = Duration(milliseconds: 300);
    Timer.periodic(duration, (timer) {
      updateSnake();
      if (gameOver()) {
        timer.cancel();
        _showGameOverScreen();
      }
    });
  }

  var direction = 'down';
  void updateSnake() {
    setState(() {
      switch (direction) {
        case 'down':
          if (snakePos.last > 520) {
            snakePos.add(snakePos.last + 20 - 540);
          } else {
            snakePos.add(snakePos.last + 20);
          }
          break;

        case 'up':
          if (snakePos.last < 20) {
            snakePos.add(snakePos.last - 20 + 540);
          } else {
            snakePos.add(snakePos.last - 20);
          }
          break;

        case 'left':
          if (snakePos.last % 20 == 0) {
            snakePos.add(snakePos.last - 1 + 20);
          } else {
            snakePos.add(snakePos.last - 1);
          }
          break;

        case 'right':
          if ((snakePos.last + 1) % 20 == 0) {
            snakePos.add(snakePos.last + 1 - 20);
          } else {
            snakePos.add(snakePos.last + 1);
          }
          break;

        default:
      }
      if (snakePos.last == food) {
        generateFood();
      } else {
        snakePos.removeAt(0);
      }
    });
  }

  bool gameOver() {
    for (int i = 0; i < snakePos.length; i++) {
      int count = 0;
      for (int j = 0; j < snakePos.length; j++) {
        if (snakePos[i] == snakePos[j]) {
          count += 1;
        }
        if (count == 2) {
          return true;
        }
      }
    }
    return false;
  }

  void _showGameOverScreen() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('GAME OVER'),
            content: Text('Your score: ' + (snakePos.length * 2).toString()),
            actions: <Widget>[
              RaisedButton(
                  color: Colors.white24,
                  onPressed: () {
                    startGame();
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text('Play Again',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500))),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 605.h,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfsquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 20),
                itemBuilder: (BuildContext context, int index) {
                  if (snakePos.contains(index)) {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.all(2.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.h),
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                  if (index == food) {
                    return Container(
                      padding: EdgeInsets.all(2.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.h),
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                        padding: EdgeInsets.all(2.h),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.h),
                            child: Container(
                              color: Colors.grey[900],
                            )));
                  }
                }),
          ),
          Container(
            height: 215.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/game_back.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    onPressed: () {
                      direction = 'up';
                      setState(() {});
                      // Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      maxRadius: 30.h,
                      backgroundImage: AssetImage('assets/images/up.png'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        onPressed: () {
                          direction = 'left';
                          setState(() {});
                          // Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          maxRadius: 30.h,
                          backgroundImage: AssetImage('assets/images/left.png'),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        onPressed: () {
                          direction = 'right';
                          setState(() {});
                          // Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          maxRadius: 30.h,
                          backgroundImage:
                              AssetImage('assets/images/right.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 40.h),
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: startGame,
                        child: Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto',
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                      onPressed: () {
                        direction = 'down';
                        setState(() {});
                        // Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        maxRadius: 30.h,
                        backgroundImage: AssetImage('assets/images/down.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, top: 40.h),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20.w),
                                        child: Text(
                                          'Do you want to exit the game?',
                                          style: TextStyle(
                                              fontSize: 23.sp,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage()));
                                          },
                                          child: Text("YES"),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context, 'NO');
                                          },
                                          child: Text("NO"),
                                        ),
                                      ],
                                    ),
                                  ));
                        },
                        child: Text(
                          "End",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto',
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
