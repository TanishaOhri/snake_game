import 'package:flutter/material.dart';
import 'package:snake_game/screens/game.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                ),
                Container(
                    child: Image.asset(
                  'assets/images/snake.png',
                  height: 250,
                  width: 250,
                  // fit: BoxFit.fill,
                )),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {});
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => GamePage()));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 40,
                    backgroundImage: AssetImage('assets/images/play.png'),
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/playtext.png',
                    height: 90,
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
