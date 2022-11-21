import 'package:flutter/cupertino.dart';

class Recipe {
  String? title;
  String? photo;
  String? calories;
  String? time;
  String? description;

  List<Ingridient>? ingridients;
  List<TutorialStep>? tutorial;
  List<Review>? reviews;

  Recipe(
      {this.title,
      this.photo,
      this.calories,
      this.time,
      this.description,
      this.ingridients,
      this.tutorial,
      this.reviews});

  factory Recipe.fromJson(Map<String, Object> json) {
    return Recipe(
      title: json['title'] as String,
      photo: json['photo'] as String,
      calories: json['calories'] as String,
      time: json['time'] as String,
      description: json['description'] as String,
    );
  }

  ImageProvider<Object> extractImageProvider() {
    if (photo!.contains("assets")) {
      return AssetImage(photo!);
    }
    return NetworkImage(photo!);
  }

  Image extractImage() {
    if (photo!.contains("assets")) {
      return Image.asset(photo!, fit: BoxFit.cover);
    }
    return Image.network(photo!, fit: BoxFit.cover);
  }
}

class TutorialStep {
  String? step;
  String? description;
  TutorialStep({this.step, this.description});

  Map<String, Object> toMap() {
    return {
      'step': step as String,
      'description': description as String,
    };
  }

  factory TutorialStep.fromJson(Map<String, Object> json) => TutorialStep(
        step: json['step'] as String,
        description: json['description'] as String,
      );

  static List<TutorialStep> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map(
            (e) => TutorialStep(step: e['step'], description: e['description']))
        .toList();
  }
}

class Review {
  String? username;
  String? review;
  Review({this.username, this.review});

  factory Review.fromJson(Map<String, Object> json) => Review(
        review: json['review'] as String,
        username: json['username'] as String,
      );

  Map<String, Object> toMap() {
    return {
      'username': username as String,
      'review': review as String,
    };
  }

  static List<Review> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Review(username: e['username'], review: e['review']))
        .toList();
  }
}

class Ingridient {
  String? name;
  String? size;

  Ingridient({this.name, this.size});
  factory Ingridient.fromJson(Map<String, Object> json) => Ingridient(
        name: json['name'] as String,
        size: json['size'] as String,
      );

  Map<String, Object> toMap() {
    return {
      'name': name as String,
      'size': size as String,
    };
  }

  static List<Ingridient> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Ingridient(name: e['name'], size: e['size']))
        .toList();
  }
}
