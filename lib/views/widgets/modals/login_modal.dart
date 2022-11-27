import 'package:flutter/material.dart';
import 'package:prodiag/utils/translate.dart';
import 'package:prodiag/views/screens/page_switcher.dart';
import 'package:prodiag/views/widgets/custom_text_field.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // header
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Text(
                  t(context)!.logIn,
                  style: Theme.of(context).typography.tall.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              // Form
              const CustomTextField(
                  title: 'Email', hint: 'youremail@email.com'),
              CustomTextField(
                  title: t(context)!.password,
                  hint: '**********',
                  obsecureText: true,
                  margin: const EdgeInsets.only(top: 16)),
              // Log in Button
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const PageSwitcher()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Theme.of(context).primaryColorLight,
                  ),
                  child: Text(
                    t(context)!.logIn,
                    style: Theme.of(context)
                        .typography
                        .tall
                        .bodyLarge!
                        .copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: t(context)!.forgot_password,
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: Theme.of(context)
                              .typography
                              .tall
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                          text: t(context)!.reset)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
