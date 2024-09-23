import 'package:companynewarchitecture/core/di/di.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/components/CustomItemToCart.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/controller/getxController.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/controller/item_details_view.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_cubit.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_event.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_state.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/screens/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

// class HomePage1 extends StatelessWidget {
//   const HomePage1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final CounterController controller = Get.put(CounterController());
//
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: Text("1.5H",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
//         actions: [
//           IconButton(onPressed: () {
//             // print(controller.prodcts[1]);
//             controller.geRealProduct();
//
//           }, icon: Icon(Icons.search)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
//         ],
//       ),
//       body:
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: GridView.builder(
//     scrollDirection: Axis.vertical,
//     itemCount: 1,
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     crossAxisSpacing: 2,
//     mainAxisSpacing: 5,
//     childAspectRatio: 1 / 1.65
//
//     ), itemBuilder: (context, index) {
//     return
//     Obx(()=>
//        CustomItemToCart(image: '${controller.prodcts[1]}',
//       price: '${controller.prodcts}',
//       name: '{state.prodcts[index].name}',
//       funcion: (){
//       // int? id=state.prodcts[index].id;
//       // print("${state.prodcts[index].id}");
//       // context.read<HomePageCubit>().add(GetProductDetailsEvent(id!));
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsPage(1)));
//       },
//       ),
//     );
//     }),
//     )
//
//
//
//     );
//   }
//
//
// }

// class HomePage1 extends StatelessWidget {
//   const HomePage1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Initialize the controller using Get.put()
//     final CounterController controller = Get.put(CounterController());
//     controller.geRealProduct();
//
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: Text(
//           "1.5H",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Fetch products
//               controller.geRealProduct();
//               print('=====7======${controller.prodcts[1]}');
//             },
//             icon: Icon(Icons.search),
//           ),
//           IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
//         ],
//       ),
//       body: Obx(() {
//         // Check if the product list is empty
//         if (controller.prodcts.isEmpty) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         // Display products in GridView when products are available
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: GridView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: controller.prodcts.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 2,
//               mainAxisSpacing: 5,
//               childAspectRatio: 1 / 1.65,
//             ),
//             itemBuilder: (context, index) {
//               var product = controller.prodcts.value[index]; // Access product data
//
//               return Obx(()=>
//                 CustomItemToCart(
//                   image: '${product.mainImage}', // Product image
//                   price: '${product.minPrice}', // Product price
//                   name: '${product.name}', // Product name
//                   funcion: () {
//                     // Handle navigation to the details page (assuming product has an id)
//                     int? id = product.id;
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ItemDetailsPage(id ?? 1), // Pass product ID
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         );
//       }),
//     );
//   }
// }

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using Get.put()
    final CounterController controller = Get.put(CounterController());
    controller.geRealProduct();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "1.5H",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Fetch products
              controller.geRealProduct();
              print('=====7======${controller.prodcts[1]}');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
        ],
      ),
      body: Obx(() {
        // Check if the product list is empty
        if (controller.prodcts.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        // Display products in GridView when products are available
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.prodcts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 5,
              childAspectRatio: 1 / 1.65,
            ),
            itemBuilder: (context, index) {
              var product = controller.prodcts[index]; // Access product data

              return CustomItemToCart(
                image: '${product.mainImage}', // Product image
                price: '${product.minPrice}', // Product price
                name: '${product.name}', // Product name
                funcion: () {
                  // Handle navigation to the details page (assuming product has an id)
                  int? id = product.id;
                  controller.geRealProductDetais(id!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailsPage1(id ?? 1), // Pass product ID
                    ),
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }
}


