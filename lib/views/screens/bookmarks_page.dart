import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodiag/utils/translate.dart';
import '../../models/movies/movie_cubit.dart';
import '../../models/movies/movie_state.dart';
import '../../utils/logger.dart';
import '../widgets/recipe_tile.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  TextEditingController searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    info("$runtimeType : ${searchInputController.text.isEmpty}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(t(context)!.bookmarks_my_bets,
            style: Theme.of(context).primaryTextTheme.titleMedium),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;

            return Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: movies.length,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (context, index) {
                  return RecipeTile(
                    data: movies[index],
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
