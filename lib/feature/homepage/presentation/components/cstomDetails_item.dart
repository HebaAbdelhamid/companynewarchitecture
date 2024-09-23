import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

class CustomDetailsItem extends StatelessWidget {
  String image;
  String brand;
  String count;
  String rate;
   CustomDetailsItem({
     required this.image,
     required this.brand,
     required this.count,
     required this.rate,

     super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Card(
            shadowColor: Colors.grey,
            color: Color(0xffD5D5DB
            ),
            child:   Image.network(
              "$image",
              width: MediaQuery.of(context).size.width * .47,
              height: MediaQuery.of(context).size.width * .59,
              fit: BoxFit.fitWidth,
            ) ,
          ),
        ),
        SizedBox(height: 9,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11),
          decoration: BoxDecoration(
            color: Colors.white,

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$count",maxLines: 3,
                style: TextStyle(
                  overflow: TextOverflow.visible,
                  color: Color(0xff252525),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "brand  ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7C7D85),
                        )),
                    TextSpan(
                        text: "$brand ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,

                          color: Color(0xff2B3363),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 7,),
              Row(
                children: [
                  Icon(
                    Icons.report_gmailerrorred_outlined,
                    color: Color(0xffF51519),),
                  Text("$count",style: TextStyle(
                      color: Color(0xffF51519),fontSize: 16,fontWeight: FontWeight.w400
                  ),),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Rate(
                    iconSize: 27,
                    color: Color(0xffFFD700),
                    allowHalf: true,
                    allowClear: true,
                    initialValue: 3.5,
                    readOnly: false,
                    onChange: (value) {

                      print(value);
                    },
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.share_outlined,size: 24,))

                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
