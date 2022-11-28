import '../../utils/logger.dart';
import '../core/recipe.dart';
import '../helper/recipe_helper.dart';

class MovieModel extends Recipe {
  MovieModel(
      this.id,
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

  MovieModel.from(this.id, String title, this.urlImage, String calories,
      String time, String description)
      : super(
            title: title,
            photo: urlImage,
            calories: calories,
            time: time,
            description: description);
  final String id;
  final String urlImage;

  Recipe getRecipe() {
    info("$runtimeType - id : $id");
    return RecipeHelper.featuredRecipe[0];
  }
}
