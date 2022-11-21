import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prodiag/models/core/recipe.dart';
import 'package:prodiag/models/helper/recipe_helper.dart';
import 'package:prodiag/utils/translate.dart';
import 'package:prodiag/views/screens/search_page.dart';
import 'package:prodiag/views/utils/app_color.dart';
import 'package:prodiag/views/widgets/category_card.dart';
import 'package:prodiag/views/widgets/popular_recipe_card.dart';
import 'package:prodiag/views/widgets/recommendation_recipe_card.dart';

class ExplorePage extends StatelessWidget {
  final Recipe popularRecipe = RecipeHelper.popularRecipe;
  final List<Recipe> sweetFoodRecommendationRecipe =
      RecipeHelper.sweetFoodRecommendationRecipe;

  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: false,
        title: Text(t(context)!.explore_recipe,
            style: const TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: SvgPicture.asset('assets/icons/search.svg',
                color: Colors.white),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Category
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: MediaQuery.of(context).size.width,
            height: 245,
            color: AppColor.primary,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                CategoryCard(
                    title: 'Healthy',
                    image: AssetImage('assets/images/healthy.jpg')),
                CategoryCard(
                    title: 'Drink',
                    image: AssetImage('assets/images/drink.jpg')),
                CategoryCard(
                    title: 'Seafood',
                    image: AssetImage('assets/images/seafood.jpg')),
                CategoryCard(
                    title: 'Desert',
                    image: AssetImage('assets/images/desert.jpg')),
                CategoryCard(
                    title: 'Spicy',
                    image: AssetImage('assets/images/spicy.jpg')),
                CategoryCard(
                    title: 'Meat', image: AssetImage('assets/images/meat.jpg')),
              ],
            ),
          ),
          // Section 2 - Popular Card
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: PopularRecipeCard(
              data: popularRecipe,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  t(context)!.today_sweet,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              // Content
              SizedBox(
                height: 174,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: sweetFoodRecommendationRecipe.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    return RecommendationRecipeCard(
                        data: sweetFoodRecommendationRecipe[index]);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
