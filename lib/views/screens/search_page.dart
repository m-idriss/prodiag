import 'package:prodiag/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prodiag/models/core/recipe.dart';
import 'package:prodiag/models/helper/recipe_helper.dart';
import 'package:prodiag/views/utils/app_color.dart';
import 'package:prodiag/views/widgets/modals/search_filter_modal.dart';
import 'package:prodiag/views/widgets/recipe_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchInputController = TextEditingController();
  final List<Recipe> searchResult = RecipeHelper.sarchResultRecipe;

  @override
  Widget build(BuildContext context) {
    info("$runtimeType : ${searchInputController.text.isEmpty}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text('Search Recipe',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Search
          Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            color: AppColor.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
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
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.2)),
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
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 12),
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
                ),
                // Search Keyword Recommendation
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 8),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: popularRecipeKeyword.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 8);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: TextButton(
                          onPressed: () {
                            searchInputController.text =
                                popularRecipeKeyword[index];
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.15),
                                width: 1),
                          ),
                          child: Text(
                            popularRecipeKeyword[index],
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          // Section 2 - Search Result
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: const Text(
                    'This is the result of your search..',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: searchResult.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return RecipeTile(
                      data: searchResult[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
