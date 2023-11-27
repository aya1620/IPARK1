import 'package:flutter/material.dart';
import 'package:ipark/Home2.dart';
import 'survey.dart';
import 'offering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> isOccupiedList = List.generate(14, (index) => false);
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  double parkingPrice = 3.0; // Placeholder for parking price

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.amber,
            colorScheme: ColorScheme.light(primary: Colors.amber),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.amber,
            colorScheme: ColorScheme.light(primary: Colors.amber),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _showMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    final List<PopupMenuItem<String>> items = [
      PopupMenuItem<String>(
        value: 'survey',
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ListTile(
            leading: Icon(Icons.edit, color: Colors.black),
            title: Text(
              'Edit Survey',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      PopupMenuItem<String>(
        value: 'offering',
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ListTile(
            leading: Icon(Icons.local_offer, color: Colors.black),
            title: Text(
              'View Offers',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    ];

    final String? result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(0, 0, 0, overlay.size.height),
      items: items,
      elevation: 8,
      color: Colors.amber,
    );

    if (result == 'survey') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => survey()),
      );
    } else if (result == 'offering') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => offering()),
      );
    }
  }

  void _showPrice() {
    // Placeholder logic for fetching the actual parking price
    double pricePerMonth = 60.0; // Replace with your logic to get the actual price per month

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Parking Price'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price: \$${parkingPrice.toString()}'),
              SizedBox(height: 8.0),
              Text('Price per Month: \$${pricePerMonth.toString()}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.amber, // Set AlertDialog background color to amber
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          backgroundColor: Colors.amber,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            iconSize: 40.0,
            onPressed: () {
              _showMenu(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(

                children: [

                  Positioned.fill(
                    child: Image.asset(
                      'assets1.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                  ),
                  Container(

                    height: double.infinity,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(

                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    int colNumber = index % 5 + 1;
                    String parkingText = 'P${index + 1}';
                    return GestureDetector(
                      onTap: () async {
                        await _selectDate(context);
                        await _selectTime(context);
                        setState(() {
                          isOccupiedList[index] = true;
                        });
                      },
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: isOccupiedList[index] ? Colors.red : Colors.green,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                parkingText,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                              if (isOccupiedList[index])
                                Text(
                                  'Reserved',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.attach_money,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _showPrice();
                      },
                    ),
                    Text(
                      'Price: \$${parkingPrice.toString()}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Second floor',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home2()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}