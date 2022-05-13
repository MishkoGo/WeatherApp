import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(124, 187, 231, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(181, 217, 243, 1),
        title: Text('Search weather', style: TextStyle(color: Color.fromRGBO(36, 36, 36, 50)),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search Countries', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            TextField(
               decoration: InputDecoration(
                 hintText: "Enter your country/city",
                 focusColor: Colors.black,
                 fillColor: Colors.white,
                 prefixIcon: Icon(Icons.search, color: Colors.grey,),
                 filled: true,
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                     borderSide: BorderSide(color: Color.fromRGBO(181, 217, 243, 1), width: 3)
                 ),
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                     borderSide: BorderSide(color: Color.fromRGBO(181, 217, 243, 1), width: 3)
                 ),
               ),
            ),
          ],
        ),
      ),
    );
  }
}
