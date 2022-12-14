import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String image;
  final String name;
  final String occupation;
  const AppointmentCard( {required this.image,required this.name,required this.occupation});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.1),
            ),
          ],

        ),
        child: Column(
          children: [
            Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    height:50,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      child: Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    Text(occupation),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width/3.6,
                ),
                TextButton(onPressed: (){

                },child: Icon(Icons.outbond_outlined,color:Colors.black),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 12.0),
                  child: Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6.0)
                    ),
                    child: TextButton(
                      onPressed: (){}, child: Text('pending',style: TextStyle(color: Colors.white),),),
                  ),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12.0),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252,239,231,3),
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: TextButton(
                          onPressed: (){}, child: Text('15 Oct 2022',style: TextStyle(color: Colors.redAccent),),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12.0),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: TextButton(
                          onPressed: (){}, child: Text('8:30 - 9:30',style: TextStyle(backgroundColor: Colors.blue,color: Colors.white),),),
                      ),
                    ),
                  ],
                )

              ],
            )


          ],


        ),
      ),
    );
  }
}
