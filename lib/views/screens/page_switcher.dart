import 'package:flutter/material.dart';
import 'package:prodiag/views/screens/explore_page.dart';
import 'package:prodiag/views/screens/home_page.dart';
import 'package:prodiag/views/widgets/custom_bottom_navigation_bar.dart';

import 'bookmarks_bloc.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({super.key});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          [
            HomePage(),
            ExplorePage(),
            const BookmarksBloc(),
          ][_selectedIndex],
          const BottomGradientWidget(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}

class BottomGradientWidget extends StatelessWidget {
  const BottomGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).indicatorColor.withOpacity(0.2),
            Theme.of(context).indicatorColor.withOpacity(0)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
      ),
    );
  }
}
