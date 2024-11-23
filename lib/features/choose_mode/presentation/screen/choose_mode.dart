import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../register_or_sign_in/presentation/screen/register_or_sign_in_page.dart';

import '../cubit/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.chooseModeBG,
                )
              )
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      AppVectors.logo
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Choose Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 40,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DarkOrLight(vector: AppVectors.moon, title: 'Dark mode', themeMode: ThemeMode.dark),
                    const SizedBox(width: 40,),
                    DarkOrLight(vector: AppVectors.sun, title: 'Light mode', themeMode: ThemeMode.light)
                  ],
                 ),
                  const SizedBox(height: 50,),
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const RegisterOrSigninPage()
                        )
                     );
                    },
                    title: 'Continue'
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}

class DarkOrLight extends StatelessWidget {
  DarkOrLight({super.key, required this.vector, required this.title, required this.themeMode});

  final dynamic vector;
  final String title;
  final dynamic themeMode;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: (){
            context.read<ThemeCubit>().updateTheme(themeMode);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color(0xff30393C).withOpacity(0.5),
                    shape: BoxShape.circle
                ),
                child: SvgPicture.asset(
                  vector,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,),
         Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: MyColors.lightGrey
          ),
        )
      ],
    );
  }
}
