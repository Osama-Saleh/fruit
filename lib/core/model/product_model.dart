

import 'package:taswek/core/helper/get_avg_rating.dart';

import 'review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  final num sellingCount;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitCount;
  final List<ReviewModel> reviews;
  ProductModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.avgRating,
      required this.unitCount,
      required this.sellingCount,
      required this.reviews,
      required this.price,
      required this.isOrganic,
      required this.isFeatured,
      this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : []),
      name: json['productName'],
      code: json['code'],
      description: json['description'],
      expirationsMonths: json['exprirationMonth'],
      numberOfCalories: json['numberOfCalories'],
      unitCount: json['unitCount'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
      price: json['price'],
      isOrganic: json['isOrganicProduct'],
      isFeatured: json['isFeatureProduct'],
      imageUrl: json['urlImage'],
    );
  }

  
  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitCount': unitCount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList()
    };
  }
}