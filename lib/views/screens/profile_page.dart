import 'package:prodiag/utils/translate.dart';
import 'package:prodiag/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prodiag/views/utils/app_color.dart';
import 'package:prodiag/views/widgets/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(t(context)!.my_profile,
            style: const TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: const Text(
              'Edit',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: AppColor.primary,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                info('Code to open file manager');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: const DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(t(context)!.profile_change_picture,
                          style: const TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/camera.svg',
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: 'antonio.schmidt@example.com',
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: t(context)!.fullname,
                  value: 'Antonio Schmidt',
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: t(context)!.subscription_type,
                  value: 'Premium Subscription',
                  valueBackground: AppColor.secondary,
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: t(context)!.subscription_time,
                  value: '${t(context)!.until} 22 Oct 2021',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
