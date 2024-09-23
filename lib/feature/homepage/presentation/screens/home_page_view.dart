import 'package:companynewarchitecture/core/di/di.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/components/CustomItemToCart.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_event.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_state.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/screens/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_page_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>  getIt.get<HomePageCubit>()..add(GetAllProductEvent())
        ,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            title: Text("1.5H",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
            ],
          ),
          body:
          BlocBuilder<HomePageCubit, HomeStates>(
            builder: (context, state) {
              final cubit=BlocProvider.of<HomePageCubit>(context);
              // List<ProductModel> products = cubit.getProducts();
              return state is SuccessHomeState?
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.prodcts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1 / 1.65

                    ), itemBuilder: (context, index) {
                  return
                    CustomItemToCart(image: '${state.prodcts[index].mainImage}',
                      price: '${state.prodcts[index].minPrice}',
                       name: '${state.prodcts[index].name}',
                      funcion: (){
                      int? id=state.prodcts[index].id;
                      print("${state.prodcts[index].id}");
                      context.read<HomePageCubit>().add(GetProductDetailsEvent(id!));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsPage(id)));
                      },
                    );
                }),
              ):Center(child: CircularProgressIndicator());
            },
          ),

        )

    );
  }


}



