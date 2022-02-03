import 'package:eco_app/Config/colors.dart';
import 'package:eco_app/checkOut/googleMap/googleMap.dart';
import 'package:eco_app/providers/checkoutProvider.dart';
import 'package:eco_app/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDeliveryLocation extends StatefulWidget {
  @override
  State<AddDeliveryLocation> createState() => _AddDeliveryLocationState();
}

enum LocationType {
  Home,
  Work,
  Other,
}

class _AddDeliveryLocationState extends State<AddDeliveryLocation> {
   LocationType myType = LocationType.Home;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Add Delivery Location")),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkOutProvider.isloading == false
            ? MaterialButton(
                onPressed: () {
                  checkOutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              controller: checkOutProvider.firstName,
              labelText: "First Name",
              //keyboardType: keyboardType,
            ),
            CustomTextField(
              controller: checkOutProvider.lastName,
              labelText: "Last Name",
              //keyboardType: checkOutProvider.mobileNum,
            ),
            CustomTextField(
              controller: checkOutProvider.cityName,
              labelText: "Mobile Number",
              //keyboardType: keyboardType,
            ),
            CustomTextField(
              controller: checkOutProvider.street,
              labelText: "City Name",
              // keyboardType: keyboardType,
            ),
            CustomTextField(
              controller: checkOutProvider.street,
              labelText: "Street",
              //keyboardType: keyboardType,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CustomGoogleMap()));
                },
                child: Container(
                    height: 47,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        checkOutProvider.selectLocation == null
                            ? Text("Select Location")
                            : Text("Successfully Set Location"),
                      ],
                    ))),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Location Type"),
            ),
            RadioListTile(
              value: LocationType.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (LocationType  ?value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home_outlined,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: LocationType.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (LocationType ?value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: LocationType.Other,
              groupValue: myType,
              title: Text("other"),
              onChanged: (LocationType ?value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.other_houses_sharp,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
