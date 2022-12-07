import 'package:flutter/material.dart';


class RoughLoginScreen extends StatefulWidget {
  static var routeName = '/login';

  const RoughLoginScreen({Key? key}) : super(key: key);

  @override
  State<RoughLoginScreen> createState() => _RoughLoginScreenState();
}

class _RoughLoginScreenState extends State<RoughLoginScreen> {

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.0,bottom: 4.0),
              child: Text('Welcome',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color: Colors.white),),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.0,bottom: 4.0),
              child: Text('Back',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color: Colors.white),),
            ),

            Container(
              height: MediaQuery.of(context).size.height/1.8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),),),
              child: Column(
                children: [
                  SizedBox(height: 25.0,),

                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.lock_outlined),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(width: 0.8),
                          )
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.lock_outlined),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(width: 0.8),
                          )
                      ),
                    ),
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Forgot password'),
                      ),

                    ],
                  ),


                  Container(
                    height: screenHeight/11,
                    width: screenWidth/1.02,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40.0),

                    ),
                    child: Center(child: Text('Welcome')),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('don\'t have an account?'),
                      TextButton(onPressed: (){},child: Text('signup'),)
                    ],
                  ),
                ],
              ),
            ),

          ],
        )

    );
  }
}

