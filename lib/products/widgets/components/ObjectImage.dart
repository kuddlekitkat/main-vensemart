import 'package:flutter/material.dart';


class ObjectImage extends StatelessWidget {
  const ObjectImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/4,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0.1),
            blurRadius: 1,
            color: Colors.black.withOpacity(0.4),
          ),
        ],

      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0,),
          Container(
            margin: EdgeInsets.all(12.0),
            height: MediaQuery.of(context).size.height /11,
            width: MediaQuery.of(context).size.width/5.7,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: const DecorationImage(
                  image: AssetImage('assets/images/user5.jpg'),
                  fit: BoxFit.cover
    ),
    ),
          ),
              ],
          ),
    );
  }
}
