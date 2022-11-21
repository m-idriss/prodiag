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

  MovieModel.n(String title, this.urlImage)
      : super(title: title, photo: urlImage);

  final String urlImage;
}
