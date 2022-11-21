import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodiag/views/screens/bookmarks_page.dart';

import '../../models/movies/movie_cubit.dart';
import '../../models/movies/movie_repository.dart';

class BookmarksBloc extends StatefulWidget {
  const BookmarksBloc({super.key});

  @override
  State<BookmarksBloc> createState() => _BookmarksBlocState();
}

class _BookmarksBlocState extends State<BookmarksBloc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(
          repository: MovieRepository(
            Dio(),
          ),
        ),
        child: const BookmarksPage(),
      ),
    );
  }
}
