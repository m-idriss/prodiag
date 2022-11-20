import 'package:flutter/material.dart';
import 'package:prodiag/views/utils/AppColor.dart';

class UserInfoTile extends StatelessWidget {
  final String? label, value;
  final EdgeInsetsGeometry? margin, padding;
  final Color? valueBackground;
  const UserInfoTile(
      {super.key,
      @required this.label,
      @required this.value,
      this.padding,
      this.margin,
      this.valueBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(label!,
                style: TextStyle(color: AppColor.primary, fontSize: 12)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            color: valueBackground ?? AppColor.primaryExtraSoft,
            child: Text(value!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
