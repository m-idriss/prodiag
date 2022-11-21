import '../core/recipe.dart';

class MovieModel extends Recipe {
  MovieModel(
      String title,
      String photo,
      String calories,
      String time,
      String description,
      List<Ingridient> ingridients,
      List<TutorialStep> tutorial,
      List<Review> reviews,
      this.urlImage)
      : super(
            title: title,
            photo: urlImage,
            calories: calories,
            time: time,
            description: description,
            ingridients: ingridients,
            tutorial: tutorial,
            reviews: reviews);

  MovieModel.from(String title, this.urlImage, String calories, String time,
      String description)
      : super(
          title: title,
          photo: urlImage,
          calories: calories,
          time: time,
          description: description,
        );

  final String urlImage;
}
