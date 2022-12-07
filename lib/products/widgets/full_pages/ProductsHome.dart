import 'package:flutter/material.dart';
import 'package:vensemart/products/widgets/components/CategoryImage.dart';
import 'package:vensemart/products/widgets/components/FeaturedImage.dart';
import 'package:vensemart/products/widgets/components/TopSellingImage.dart';



class ProductsHome extends StatelessWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                )
              ],
            ) ,



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                CategoryImage(image: 'assets/images/CatElectronics1.png', name: 'name'),
                CategoryImage(image: 'assets/images/CatElectronics2.png', name: 'name'),
                CategoryImage(image: 'assets/images/CatElectronics3.png', name: 'name'),

              ],

            ),

            SizedBox(height: 20.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryImage(image: 'assets/images/catphones2.png', name: 'name'),
                CategoryImage(image: 'assets/images/catcomputers.png', name: 'name'),
                CategoryImage(image: 'assets/images/catkids.png', name: 'name'),

              ],

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
                TopSellingImage(image: 'assets/images/topselling1.png', name: 'headphones', price: 'N12,000'),
                TopSellingImage(image: 'assets/images/topselling2.png', name: 'furniture', price: '50,000'),
                TopSellingImage(image: 'assets/images/topselling3.png', name: 'Nike shoes', price: '15,000'),

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
                TopSellingImage(image: 'assets/images/topselling7.png', name: 'Macbook pro', price: 'N800,000'),
                TopSellingImage(image: 'assets/images/topselling8.png', name: 'Itel phone', price: 'N120,000'),
                TopSellingImage(image: 'assets/images/topselling9.png', name: 'iPhone 13', price: 'N800,000'),

              ],

            ),

            SizedBox(height: 20.0,),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text('Featured shops', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                )
              ],
            ) ,


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                FeaturedImage(image: 'assets/images/featuredshop1.png', name: 'Amarachi salon'),
                FeaturedImage(image: 'assets/images/featuredshop2.png', name: 'Nails Salon'),
                FeaturedImage(image: 'assets/images/featuredshop3.png', name: 'Tailor'),
              ],
            ),
            SizedBox(height: 20.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                FeaturedImage(image: 'assets/images/featuredshop4.png', name: 'Home Decor'),
                FeaturedImage(image: 'assets/images/featuredshop5.png', name: 'WD Security'),
                FeaturedImage(image: 'assets/images/featuredshop6.png', name: 'happy dry'),
              ],
            ),
            SizedBox(height: 20.0,),



          ],
        ),
      ),),
    );
  }
}
