import 'package:eco_app/models/productmodel.dart';
import 'package:eco_app/widgets/singleItem.dart';
import 'package:flutter/material.dart';

enum SingingCharacter {
  lowToHigh,
  highToLow,
  alphabetically,
}

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({required this.search});
  //const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //SingingCharacter _character = SingingCharacter.alphabetically;
  String query = "";
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);

    // void bottomSheet()=> showModalBottomSheet(context: context,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20),),
    //
    //     ),
    //     builder:(context){
    //       return Column(
    //           mainAxisSize  : MainAxisSize.min,
    //           children: [
    //       ListTile(
    //       title: new Text("Sort By",style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       ),
    //       RadioListTile(value: SingingCharacter.lowToHigh, groupValue: _character,title: Text("low to high"), onChanged:(vav){
    //       setState(() {
    //       //_character= vav;
    //       });
    //       Navigator.of(context).pop();
    //       }),
    //       RadioListTile(value: SingingCharacter.highToLow, groupValue: _character,title: Text("high to low"), onChanged:(vav){
    //       setState(() {
    //       //_character= vav;
    //       });
    //       Navigator.of(context).pop();
    //       }),
    //       RadioListTile(value: SingingCharacter.alphabetically, groupValue: _character,title: Text("Alphabetically"), onChanged:(vav){
    //       setState(() {
    //       //_character= vav;
    //       });
    //       Navigator.of(context).pop();
    //       }),
    //             Container(
    //               height: 46,
    //                 margin: EdgeInsets.symmetric(vertical: 20,horizontal:20 ),
    //               width: double.infinity,
    //               child: MaterialButton(
    //                 child: Text("Submit"),
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(30)
    //                 ),
    //                 color: primaryColor,
    //                 onPressed: (){},
    //               ),
    //             ),
    //       ],
    //       );
    //     });

    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              //we don't take controller it's take controller value but we take onChanged because onChanged have String feature./
              onChanged: (value) {
                //print(value);
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey,
                filled: true,
                hintText: "Search Item",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isbool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productQuantity: data.productPrice,
                productUnit: data.productUnit,
                productId: data.productId, onDelete: () {}, favList: false,
                // favList:,
                // onDelete: null,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
