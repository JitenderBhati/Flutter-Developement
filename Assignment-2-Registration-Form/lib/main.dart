import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/images/logo.jpg"),
          centerTitle: true,
          leading: Icon(
            Icons.dehaze,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profileImage.png"),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: MainUI(),
      ),
    )));

class MainUI extends StatefulWidget {
  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Create Shipment",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Step 1 of 6 - Shipper",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                roundButton("1", true),
                divider(),
                roundButton("2", false),
                divider(),
                roundButton("3", false),
                divider(),
                roundButton("4", false),
                divider(),
                roundButton("5", false),
                divider(),
                roundButton("6", false)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "*",
                style: TextStyle(color: Colors.red),
              ),
              Text(
                "Indicates Required Fields",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          formData("Shipper", "Company Name", 20.0),
          formData("Location", "Address", 0.0),
          formData("BOL #", "Optional", 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dropDownSetup("Service Mode", "LTL"),
                dropDownSetup("Transit Service", "Select One...")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Picup Services",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
          ),
          Column(
            children: <Widget>[
              buildRow(true, "Construction Site"),
              buildRow(false, "Courier Service"),
              buildRow(false, "Drayage Service"),
              buildRow(false, "Dropped Trailer"),
              buildRow(false, "Inside Service"),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dropDownSetup("Date Pickup\nRequested", "Select Date..."),
                dropDownSetup("Date Pickup\nActual", "Select Date...")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 50.0,
                  child: RaisedButton(
                    elevation: 0.0,
                    disabledColor: Colors.white,
                    child: Text(
                      "Back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16.0),
                    ),
                  ),
                ),
                Container(
                  width: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    elevation: 0.0,
                    disabledColor: Colors.black,
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row buildRow(bool status, String value) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: status,
          activeColor: status ? Colors.green : Colors.grey[400],
          onChanged: (bool value) {},
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.grey),
        )
      ],
    );
  }

  Column dropDownSetup(String value, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.grey[300]),
          width: 150.0,
          height: 40.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                onChanged: (String datas) {},
                hint: Text(data),
                items: <String>['Python', 'Flutter', 'JavaScript', 'Java', 'GraphQL', 'ReactJS'].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
              ),
            ),
          ),
        )
      ],
    );
  }

  Wrap formData(String leftText, String rightText, double topPadding) {
    return Wrap(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: topPadding),
          height: 60.0,
          width: 150.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(style: BorderStyle.solid, color: Colors.grey),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Text(
              leftText,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: topPadding),
          width: 300.0,
          height: 60.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.grey, style: BorderStyle.solid)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: rightText),
            ),
          ),
        )
      ],
    );
  }

  Container divider() => Container(
        color: Colors.grey,
        width: 30.0,
        height: 1.0,
      );

  Container roundButton(String text, bool status) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: status ? Colors.black : Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(color: status ? Colors.white : Colors.grey),
      ),
    );
  }
}
