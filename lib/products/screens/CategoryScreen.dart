import 'package:flutter/material.dart';

import '../widgets/components/TopSellingImage.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics',style: TextStyle(color: Colors.black),),
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        elevation: 0.00,

      ),
      backgroundColor: Color.fromRGBO(234, 234, 234, 2),
      body: Padding(padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(

            children: [

              Container(
                margin: EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintText: 'what are you looking for',
                    prefixIcon: Icon(Icons.search),

                    hintStyle: TextStyle(color: Colors.grey[600]),
                    fillColor: Color.fromRGBO(250,250,254,1),),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height/5.5,
                width:MediaQuery.of(context).size.width/1.1,
                decoration: BoxDecoration(

                  image: DecorationImage(
                    image: AssetImage('assets/images/proj.png'),
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),



              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text('Top Selling', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  )
                ],
              ) ,



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TopSellingImage(image: 'assets/images/electronics1.png', name: 'Smart tv', price: 'N12,000'),
                  TopSellingImage(image: 'assets/images/electronics2.png', name: 'furniture', price: '50,000'),
                  TopSellingImage(image: 'assets/images/electronics3.png', name: 'Nike shoes', price: '15,000'),

                ],

              ),

              SizedBox(height: 20.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TopSellingImage(image: 'assets/images/topselling4.png', name: 'Washing machine', price: 'N160,000'),
                  TopSellingImage(image: 'assets/images/topselling5.png', name: 'Wristwatch', price: 'N12,000'),
                  TopSellingImage(image: 'assets/images/topselling6.png', name: 'Ear buds', price: 'N10,000'),

                ],

              ),

              SizedBox(height: 20.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TopSellingImage(image: 'assets/images/topselling9.png', name: 'Macbook pro', price: 'N800,000'),
                  TopSellingImage(image: 'assets/images/topselling10.png', name: 'Itel phone', price: 'N120,000'),
                  TopSellingImage(image: 'assets/images/topselling11.png', name: 'iPhone 13', price: 'N800,000'),

                ],

              ),








              SizedBox(height: 20.0,),



            ],
          ),
        ),),
    );
  }
}
