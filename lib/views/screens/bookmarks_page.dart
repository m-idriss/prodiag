import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prodiag/models/core/recipe.dart';
import 'package:prodiag/models/helper/recipe_helper.dart';
import 'package:prodiag/views/utils/app_color.dart';
import 'package:prodiag/views/widgets/modals/search_filter_modal.dart';
import 'package:prodiag/views/widgets/recipe_tile.dart';
import 'package:prodiag/utils/utils.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  TextEditingController searchInputController = TextEditingController();
  List<Recipe> bookmarkedRecipe = RecipeHelper.bookmarkedRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: false,
        elevation: 0,
        title: const Text('Bookmarks : my bets',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Search Bar
          Container(
            width: MediaQuery.of(context).size.width,
            height: 95,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: AppColor.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Search TextField
                    Expanded(
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.primarySoft),
                        child: TextField(
                          controller: searchInputController,
                          onChanged: (value) {
                            info(
                                "$runtimeType : ${searchInputController.text}");
                            setState(() {});
                          },
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          maxLines: 1,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: 'What do you want to eat?',
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.2)),
                            prefixIconConstraints:
                                const BoxConstraints(maxHeight: 20),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 17),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Visibility(
                              visible: (searchInputController.text.isEmpty)
                                  ? true
                                  : false,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 12),
                                child: SvgPicture.asset(
                                  'assets/icons/search.svg',
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Filter Button
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            builder: (context) {
                              return const SearchFilterModal();
                            });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.secondary,
                        ),
                        child: SvgPicture.asset('assets/icons/filter.svg'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // Section 2 - Bookmarked Recipe
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: bookmarkedRecipe.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                return RecipeTile(
                  data: bookmarkedRecipe[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
