import 'package:flutter/material.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';

class ServicesGridScreen extends StatefulWidget {
  const ServicesGridScreen({Key? key}) : super(key: key);

  @override
  State<ServicesGridScreen> createState() => _ServicesGridScreenState();
}

class _ServicesGridScreenState extends State<ServicesGridScreen> {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar: AppBar(
          title: Text('Services',style: TextStyle(color: Colors.grey),),
          backgroundColor: Color.fromRGBO(234, 234, 234, 2),
          elevation: 0.00,

        ),
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        body: SingleChildScrollView(
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
                    hintText: 'what service are you looking for',
                    prefixIcon: Icon(Icons.search,color: Colors.white,),

                    hintStyle: TextStyle(color: Colors.grey[600]),
                    fillColor: Color.fromRGBO(250,250,254,1),),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height/1.2,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                  children: <Widget>[

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Cleaner',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid1.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Barber',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid2.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),


                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Barber',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid3.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Tiler',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid4.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Electrician',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {

                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid5.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(

                          title: Center(child: Text('Solar Installer',maxLines: 5,style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid6.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(

                          title: Center(child: Text('Painter',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid7.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(

                          title: Center(child: Text('Carpenter',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid8.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),


                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(

                          title: Center(child: Text('Fridge Repairer',maxLines: 5,style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid9.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),


                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Bricklayer',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid10.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Aluminium window',maxLines: 5,style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid11.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: GridTileBar(
                          title: Center(child: SizedBox(
                               width: MediaQuery.of(context).size.width/2,
                              child: Text('CCTV installer',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),))),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid12.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('AC installer',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {

                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid13.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Mechanic',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid14.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(

                        footer: const GridTileBar(
                          title: Center(child: Text('Dish installer',style: TextStyle(fontWeight: FontWeight.bold),)),
                          backgroundColor: Colors.black54,
                        ),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => AvailableServicesListScreen(),
                              ),
                            );

                          },
                          child: Image.asset(
                            'assets/images/ServiceGrid15.png',
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
