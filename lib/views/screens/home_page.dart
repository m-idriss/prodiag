import 'package:flutter/material.dart';
import 'package:prodiag/models/core/recipe.dart';
import 'package:prodiag/models/helper/recipe_helper.dart';
import 'package:prodiag/utils/translate.dart';
import 'package:prodiag/views/screens/delicious_today_page.dart';
import 'package:prodiag/views/screens/newly_posted_page.dart';
import 'package:prodiag/views/screens/profile_page.dart';
import 'package:prodiag/views/screens/search_page.dart';
import 'package:prodiag/views/widgets/custom_app_bar.dart';
import 'package:prodiag/views/widgets/dummy_search_bar.dart';
import 'package:prodiag/views/widgets/featured_recipe_card.dart';
import 'package:prodiag/views/widgets/recipe_tile.dart';
import 'package:prodiag/views/widgets/recommendation_recipe_card.dart';

class HomePage extends StatelessWidget {
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  final List<Recipe> recommendationRecipe = RecipeHelper.recommendationRecipe;
  final List<Recipe> newlyPostedRecipe = RecipeHelper.newlyPostedRecipe;

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(t(context)!.app_title,
            style: Theme.of(context).primaryTextTheme.titleLarge),
        showProfilePhoto: true,
        profilePhoto: const AssetImage('assets/images/profile.jpg'),
        profilePhotoOnPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfilePage()));
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Featured Recipe - Wrapper
          Container(
            height: 350,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 245,
                  color: Theme.of(context).primaryColor,
                ),
                // Section 1 - Content
                Column(
                  children: [
                    // Search Bar
                    DummySearchBar(
                      routeTo: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchPage()));
                      },
                    ),
                    // Delicious Today - Header
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(t(context)!.delicious_today,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DeliciousTodayPage()));
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                textStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall),
                            child: Text(t(context)!.see_all),
                          ),
                        ],
                      ),
                    ),
                    // Delicious Today - ListView
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 220,
                      child: ListView.separated(
                        itemCount: featuredRecipe.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 16,
                          );
                        },
                        itemBuilder: (context, index) {
                          return FeaturedRecipeCard(
                              data: featuredRecipe[index]);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Section 2 - Recommendation Recipe
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    t(context)!.today_recommendation,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                // Content
                SizedBox(
                  height: 174,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendationRecipe.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return RecommendationRecipeCard(
                          data: recommendationRecipe[index]);
                    },
                  ),
                )
              ],
            ),
          ),
          // Section 3 - Newly Posted
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t(context)!.newly_posted,
                        style: Theme.of(context).textTheme.headline6),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewlyPostedPage()));
                      },
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(t(context)!.see_all),
                    ),
                  ],
                ),
                // Content
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: newlyPostedRecipe.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return RecipeTile(
                      data: newlyPostedRecipe[index],
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
