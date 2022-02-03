import 'package:eco_app/Config/colors.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(child: Container(
            height: 100,
            child: Center(
              child: Image.network("https://th.bing.com/th/id/R.0cfe624921b69dc02685ccb8f27ac488?rik=zWyVh0Kq28%2bIDA&pid=ImgRaw&r=0"),
            ),
          ),),
          Expanded(child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("productName"),
                    Text("500 tk", style: TextStyle(color: Colors.grey ),),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text("1 Kg", style: TextStyle(color: Colors.grey, fontSize: 13 ),)
                        ,),
                      Center(child: Icon(Icons.arrow_drop_down, size: 20, color: primaryColor,),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 32),
            child: Container(
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color:  primaryColor,
                      size:20,),
                    Text("ADD", style: TextStyle(color: primaryColor, fontSize: 13 ),)


                  ],
                ),
              ),
            ),
          ))

        ],
      ),
    );
  }
}
