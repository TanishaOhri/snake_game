import 'package:flutter/material.dart';
import 'package:snake_game/screens/homepage.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text(
                          'Do you want to exit the game?',
                          style: TextStyle(fontSize: 23, fontFamily: 'Roboto'),
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: Text("YES"),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
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
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
        ],
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/logo.png',
          ),
          backgroundColor: Colors.black,
        ),
        elevation: 1,
        backgroundColor: Colors.black,
        title: Text(
          "Snake World",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 500,
                ),
                Container(
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
                            setState(() {});
                            // Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            maxRadius: 30,
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
                                setState(() {});
                                // Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                maxRadius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/left.png'),
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {});
                                // Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                maxRadius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/right.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          onPressed: () {
                            setState(() {});
                            // Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            maxRadius: 30,
                            backgroundImage:
                                AssetImage('assets/images/down.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
