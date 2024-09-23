import 'package:companynewarchitecture/feature/homepage/domain/entities/product.dart';

class prodDuctModel {
  bool? success;
  List<Product>? data;
  String? message;

  prodDuctModel({this.success, this.data, this.message});

  prodDuctModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Product extends Productt {

  Product({super.id, super.name, super.minPrice, super.mainImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    minPrice = json['min_price'];
    mainImage = json['main_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['min_price'] = this.minPrice;
    data['main_image'] = this.mainImage;
    return data;
  }
}
