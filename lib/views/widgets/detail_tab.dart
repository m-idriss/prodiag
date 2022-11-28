import 'package:flutter/material.dart';
import 'package:prodiag/views/widgets/review_tile.dart';
import 'package:prodiag/views/widgets/step_tile.dart';

import '../../models/core/recipe.dart';
import '../../models/movies/movie_model.dart';
import 'ingridient_tile.dart';

class DetailTab extends StatelessWidget {
  final int indexTabSelected;
  final Recipe data;

  DetailTab({Key? key, required this.indexTabSelected, required Recipe data})
      : data = data is MovieModel ? data.getRecipe() : data,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: indexTabSelected,
      children: [
        // Ingridients
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: data.ingridients!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return IngridientTile(
              data: data.ingridients![i],
            );
          },
        ),
        // Tutorials
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: data.tutorial!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return StepTile(
              data: data.tutorial![i],
            );
          },
        ),
        // Reviews
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: data.reviews!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return ReviewTile(
              data: data.reviews![i],
            );
          },
        )
      ],
    );
  }
}
