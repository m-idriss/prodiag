import 'package:flutter/material.dart';

class SearchFilterModal extends StatelessWidget {
  const SearchFilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        // Section 1 - Header
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Theme.of(context).selectedRowColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 60,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Reset',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ),
              Text(
                'Sort by',
                style: Theme.of(context).dialogTheme.titleTextStyle,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 60,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
        ),
        // Sort By Option
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!.withOpacity(1)))),
          child: ListTileTheme(
            selectedColor: Theme.of(context).primaryColor,
            textColor: Colors.grey,
            child: const ListTile(
              selected: true,
              title:
                  Text('Newest', style: TextStyle(fontWeight: FontWeight.w600)),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
        ),
        // Sort By Option
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!.withOpacity(1)))),
          child: ListTileTheme(
            selectedColor: Theme.of(context).primaryColor,
            textColor: Colors.grey,
            child: const ListTile(
              selected: false,
              title:
                  Text('Oldest', style: TextStyle(fontWeight: FontWeight.w600)),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
        ),
        // Sort By Option
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!.withOpacity(1)))),
          child: ListTileTheme(
            selectedColor: Theme.of(context).primaryColor,
            textColor: Colors.grey,
            child: const ListTile(
              selected: false,
              title: Text('Popular',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
}
