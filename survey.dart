import 'package:flutter/material.dart';
import 'package:ipark/Home.dart';

class survey extends StatelessWidget {
  const survey({Key? key}) : super(key: key);

  // Define a list of car colors
  final List<String> carColors = const ['Red', 'Blue', 'Green', 'Yellow', 'Black', 'White', 'gold', 'silver', 'brown', 'other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'I',
                style: TextStyle(color: Colors.white, fontSize: 62),
              ),
              TextSpan(
                text: 'PARK',
                style: TextStyle(color: Colors.yellow, fontSize: 58),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/location3.png"), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black), // Set the label color to white
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Family Name',
                    labelStyle: TextStyle(color: Colors.black), // Set the label color to white
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Car Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Car Type',
                    labelStyle: TextStyle(color: Colors.black), // Set the label color to white
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Change car color field to a DropdownButtonFormField
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Car Color',
                    labelStyle: TextStyle(color: Colors.black), // Set the label color to white
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: carColors.map((color) {
                    return DropdownMenuItem<String>(
                      value: color,
                      child: Text(color),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // Handle dropdown value change
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Year',
                    labelStyle: TextStyle(color: Colors.black), // Set the label color to white
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Contact Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.black), // Set the label color to white
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Set the border color to white
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                // ... Other contact information fields
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}