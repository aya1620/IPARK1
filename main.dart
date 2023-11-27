import 'package:flutter/material.dart';
import'signup.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'I',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 62,
                        ),
                      ),
                      Text(
                        'PARK',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 58,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0),
                  Image.asset('assets/location2.png',width: 330, height: 330,),
                ],
              ),
            ),
            Positioned(
              top: -80,
              right: -120,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150.0),
                      ),
                    ),
                  ),
                  child: Text(''),
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              left: -120,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality for the button here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150.0),
                      ),
                    ),
                  ),
                  child: Text(''),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
