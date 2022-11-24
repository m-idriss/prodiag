import 'package:prodiag/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:prodiag/utils/translate.dart';
import 'package:prodiag/views/utils/app_color.dart';
import 'package:prodiag/views/widgets/modals/login_modal.dart';
import 'package:prodiag/views/widgets/modals/register_modal.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    info("$runtimeType - build");
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
                  Theme.of(context).primaryColor.withOpacity(0.5),
                ])),
              )),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 60 / 100,
              decoration: BoxDecoration(gradient: AppColor.linearBlackBottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(t(context)!.app_title,
                            style:
                                Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                      Text(t(context)!.welcome,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Get Started Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return const RegisterModal();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                          ),
                          child: Text(t(context)!.get_started,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'inter')),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Log in Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: OutlinedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return const LoginModal();
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.5),
                                width: 1),
                          ),
                          child: Text(t(context)!.logIn,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'inter')),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.only(top: 32),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: t(context)!.by_join_agree,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                height: 150 / 100),
                            children: [
                              TextSpan(
                                text: t(context)!.terms_of_service,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    height: 150 / 100),
                              ),
                              TextSpan(
                                text: t(context)!.privacy_policy,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
