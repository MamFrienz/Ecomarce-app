import 'package:flutter/material.dart';
class ProductUnit extends StatelessWidget {
  final Function onTap;
  final String title;
  ProductUnit({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),

      child: Container(
        padding: EdgeInsets.only(left: 2),
        height: 25,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          //color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
               '$title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11),
              ),
            ),
            Center(
                child: Icon(Icons.arrow_drop_down,
                    size: 20,
                    color: Colors.greenAccent)),
          ],
        ),
      ),
    );


  }
}
