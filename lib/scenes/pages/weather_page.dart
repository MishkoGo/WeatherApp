import 'package:flutter/material.dart';

import '../../routes.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(124, 187, 231, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            children: [
              Container(
                width: 350,
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Minsk/Belarus', style: TextStyle(color: Colors.white, fontSize: 25),),
                        SizedBox(width: 110,),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed(AppRoutes.searchRoute);
                            },
                            child: Icon(Icons.search, color: Colors.white, size: 25,),
                        ),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text('Friday, May 13, 13.00', style: TextStyle(color: Colors.white, fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/sun.png", width: 50, height: 50,),
                        SizedBox(width: 10,),
                        Text('26', style: TextStyle(color: Colors.white,fontSize: 60, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: 350,
                height: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
