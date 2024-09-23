import 'package:companynewarchitecture/feature/homepage/domain/entities/productDetails.dart';

class prodDuctDetailsModel {
  bool? success;
  Data? data;
  String? message;

  prodDuctDetailsModel({this.success, this.data, this.message});

  prodDuctDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data extends Datat {

  Data(
      {super.id,
        super.name,
        super.description,
        super.averageRating,
        super.minPrice,
        super.important,
        super.popular,
        super.stockQuantity,
        super.totalSales,
        super.images,
        super.mainImage,
        super.categoryName,
        super.brandName,
        super.notified,
        super.favourite,
        super.sellers,
        super.reviews,
        super.similarProducts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    averageRating = json['average_rating'];
    minPrice = json['min_price'];
    important = json['important'];
    popular = json['popular'];
    stockQuantity = json['stock_quantity'];
    totalSales = json['total_sales'];
    images = json['images'].cast<String>();
    mainImage = json['main_image'];
    categoryName = json['category_name'];
    brandName = json['brand_name'];
    notified = json['notified'];
    favourite = json['favourite'];
    if (json['sellers'] != null) {
      sellers = <Sellers>[];
      json['sellers'].forEach((v) {
        sellers!.add(new Sellers.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json['similar_products'] != null) {
      similarProducts = <SimilarProducts>[];
      json['similar_products'].forEach((v) {
        similarProducts!.add(new SimilarProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['average_rating'] = this.averageRating;
    data['min_price'] = this.minPrice;
    data['important'] = this.important;
    data['popular'] = this.popular;
    data['stock_quantity'] = this.stockQuantity;
    data['total_sales'] = this.totalSales;
    data['images'] = this.images;
    data['main_image'] = this.mainImage;
    data['category_name'] = this.categoryName;
    data['brand_name'] = this.brandName;
    data['notified'] = this.notified;
    data['favourite'] = this.favourite;
    if (this.sellers != null) {
      data['sellers'] = this.sellers!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.similarProducts != null) {
      data['similar_products'] =
          this.similarProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sellers {
  int? id;
  String? name;
  int? rating;
  String? image;
  String? price;

  Sellers({this.id, this.name, this.rating, this.image, this.price});

  Sellers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}

class Reviews {
  String? review;
  int? rating;
  String? userName;

  Reviews({this.review, this.rating, this.userName});

  Reviews.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    rating = json['rating'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['user_name'] = this.userName;
    return data;
  }
}

class SimilarProducts {
  int? id;
  String? name;
  String? minPrice;
  String? mainImage;

  SimilarProducts({this.id, this.name, this.minPrice, this.mainImage});

  SimilarProducts.fromJson(Map<String, dynamic> json) {
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
