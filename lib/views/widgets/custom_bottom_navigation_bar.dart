import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  final Function(int) onItemTapped;
  CustomBottomNavigationBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          onTap: widget.onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            (widget.selectedIndex == 0)
                ? BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/home-filled.svg',
                        color: Theme.of(context).primaryColor),
                    label: '')
                : BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/home.svg',
                        color: Colors.grey[600]),
                    label: ''),
            (widget.selectedIndex == 1)
                ? BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/discover-filled.svg',
                        color: Theme.of(context).primaryColor,
                        height: 28,
                        width: 26),
                    label: '')
                : BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/discover.svg',
                        color: Colors.grey[600], height: 28, width: 26),
                    label: ''),
            (widget.selectedIndex == 2)
                ? BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/bookmark-filled.svg',
                        color: Theme.of(context).primaryColor),
                    label: '')
                : BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/bookmark.svg',
                        color: Colors.grey[600]),
                    label: ''),
          ],
        ),
      ),
    );
  }
}
