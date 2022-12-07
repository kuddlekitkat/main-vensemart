import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 45.0),
            height: 200,
            child:Row(
              children: [

                Container(
                  height: 65,
                  margin: EdgeInsets.only(right: 20),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: TextField(
                      autofocus: true,
                      onChanged: (value) {
                        var last;
                        var first;
                        if (value.length == 1 && last == false) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.length == 0 && first == false) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      showCursor: false,
                      readOnly: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.purple),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 65,
                  margin: EdgeInsets.only(right: 20),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: TextField(
                      autofocus: true,
                      onChanged: (value) {
                        var last;
                        var first;
                        if (value.length == 1 && last == false) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.length == 0 && first == false) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      showCursor: false,
                      readOnly: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.purple),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 65,
                  margin: EdgeInsets.only(right: 20),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: TextField(
                      autofocus: true,
                      onChanged: (value) {
                        var last;
                        var first;
                        if (value.length == 1 && last == false) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.length == 0 && first == false) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      showCursor: false,
                      readOnly: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.purple),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 65,
                  margin: EdgeInsets.only(right: 20),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: TextField(
                      autofocus: true,
                      onChanged: (value) {
                        var last;
                        var first;
                        if (value.length == 1 && last == false) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.length == 0 && first == false) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      showCursor: false,
                      readOnly: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.purple),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      )
    );




  }


}
