class productDetailsModel {
  bool? success;
  Datat? dataa;
  String? message;

  productDetailsModel({this.success, this.dataa, this.message});


}

class Datat {
  int? id;
  String? name;
  String? description;
  int? averageRating;
  String? minPrice;
  int? important;
  int? popular;
  int? stockQuantity;
  int? totalSales;
  List<String>? images;
  String? mainImage;
  String? categoryName;
  String? brandName;
  bool? notified;
  bool? favourite;
  List<Sellers>? sellers;
  List<Reviews>? reviews;
  List<SimilarProducts>? similarProducts;

  Datat(
      {this.id,
        this.name,
        this.description,
        this.averageRating,
        this.minPrice,
        this.important,
        this.popular,
        this.stockQuantity,
        this.totalSales,
        this.images,
        this.mainImage,
        this.categoryName,
        this.brandName,
        this.notified,
        this.favourite,
        this.sellers,
        this.reviews,
        this.similarProducts});

}

class Sellers {
  int? id;
  String? name;
  int? rating;
  String? image;
  String? price;

  Sellers({this.id, this.name, this.rating, this.image, this.price});

}

class Reviews {
  String? review;
  int? rating;
  String? userName;

  Reviews({this.review, this.rating, this.userName});

}

class SimilarProducts {
  int? id;
  String? name;
  String? minPrice;
  String? mainImage;

  SimilarProducts({this.id, this.name, this.minPrice, this.mainImage});

}