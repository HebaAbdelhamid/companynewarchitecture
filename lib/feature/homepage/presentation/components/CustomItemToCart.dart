import 'package:companynewarchitecture/core/styles.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/components/custom_button.dart';
import 'package:flutter/material.dart';

class CustomItemToCart extends StatelessWidget {
  String image;
  String name;
  String price ;
  Function()funcion;

  CustomItemToCart({
    required this.image,
    required this.name,
    required this.price,
    required this.funcion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funcion,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .47,
        child: Card(
          color: Colors.grey.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children:[
                    Image.network(
                    "$image",
                    width: MediaQuery.of(context).size.width * .47,
                    height: MediaQuery.of(context).size.width * .39,
                    fit: BoxFit.fitWidth,
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child:
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.favorite_outline
                                ,
                                color: Colors.grey,
                                size: 17,
                              )),
                        ),
                      ),
                    ),]
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$name"
                        ,maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: Color(0xff252525),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "from ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff252525),
                              )),
                          TextSpan(
                              text: "$price",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,

                                  color: Colors.red,
                                 )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    CustomButton(
                      title: 'add to cart',
                      function: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsPage()));
                      },
                      bgColor: AppStyle.primaryColor,
                      textColor: Colors.white,
                    ),


                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
