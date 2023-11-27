import 'package:flutter/material.dart';
import 'survey.dart';

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            // Amber-colored section covering the entire height
            Container(
              color: Colors.amber,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate back to the previous page
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Text(
                      'If you don\'t have a previous account, you can sign up by providing a new email and creating a password below.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),

            // White-colored bottom section with rounded edges
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 1.4, // Adjust the height
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Adjust the space between Password field and Forgot Password link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Add logic for handling forgot password here
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white, // Set background color to white
                              ),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.black, // Set text color to black
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity, // Set the width to match the parent
                          child: ElevatedButton(
                            onPressed: () {
                              
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => survey()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Set background color to black
                              onPrimary: Colors.white, // Set text color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              minimumSize: Size(double.infinity, 60), // Adjust the height
                            ),
                            child: Text('Sign Up'),
                          ),
                        ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set Google button color
                        onPrimary: Colors.white, // Set text color to white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: Size(double.infinity, 60),
                      ),
                      icon: Text(
                        '\u{1F30E}',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      label: Text('Continue with Google'), // Add Google icon
                    ),
                  ),
                     SizedBox(height: 10),
                      Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add logic for handling Facebook login here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Set Facebook button color
                        onPrimary: Colors.white, // Set text color to white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: Size(double.infinity, 60),
                      ),
                      icon: Icon(Icons.facebook), // Add Facebook icon
                      label: Text('Continue with Facebook'),
                    ),
                  ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
