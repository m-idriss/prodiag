import 'package:flutter/material.dart';
import 'package:prodiag/models/core/recipe.dart';
import 'package:prodiag/models/helper/recipe_helper.dart';
import 'package:prodiag/utils/translate.dart';
import 'package:prodiag/views/widgets/popular_recipe_card.dart';
import 'package:prodiag/views/widgets/recipe_tile.dart';

class DeliciousTodayPage extends StatelessWidget {
  final Recipe popularRecipe = RecipeHelper.popularRecipe;
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;

  DeliciousTodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(t(context)!.delicious_today,
            style: Theme.of(context).primaryTextTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Popular Recipe
          Container(
            color: Theme.of(context).primaryColor,
            alignment: Alignment.topCenter,
            height: 210,
            padding: const EdgeInsets.all(16),
            child: PopularRecipeCard(data: popularRecipe),
          ),
          // Section 2 - Bookmarked Recipe
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: featuredRecipe.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                return RecipeTile(
                  data: featuredRecipe[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
