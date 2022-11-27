import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prodiag/models/core/recipe.dart';
import 'package:prodiag/views/screens/recipe_detail_page.dart';

class PopularRecipeCard extends StatelessWidget {
  final Recipe data;

  const PopularRecipeCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: data)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(15),
        // Image
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(data.photo!), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Popular Now Tag Card
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: 165,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor),
              child: Text('Popular Now !!',
                  style: Theme.of(context).primaryTextTheme.titleSmall),
            ),
            // Recipe Info Wrapper
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  height: 80,
                  width: 165,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.26),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recipe Title
                      Text(
                        data.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).typography.tall.bodyLarge,
                      ),
                      // Recipe Calories and Time
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/fire-filled.svg',
                              color: Colors.white,
                              width: 12,
                              height: 12,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Text(
                                data.calories!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.alarm,
                                size: 12, color: Colors.white),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Text(
                                data.time!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
