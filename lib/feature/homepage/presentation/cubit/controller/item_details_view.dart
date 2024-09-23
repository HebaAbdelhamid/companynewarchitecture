import 'package:companynewarchitecture/core/di/di.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/components/cstomDetails_item.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/controller/getxController.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_cubit.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_event.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_state.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/screens/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ItemDetailsPage1 extends StatelessWidget {
  int index;
  ItemDetailsPage1(this. index, {super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());

    return  Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            // context.read<HomePageCubit>().add(GetAllProductEvent());
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },icon: Icon(Icons.arrow_back),),
          title: const Text('Details', style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w600),),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  print(controller.prodctts.toString());
                }, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: CustomDetailsItem(
          count: '{}',
          brand: '{state.prodcts.brandName}',
          image: '{state.prodcts.mainImage}',
          rate: '{state.prodcts.id}',)
    );
  }


}



