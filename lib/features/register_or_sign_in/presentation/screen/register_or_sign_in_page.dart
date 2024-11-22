import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_spotify/common/is_dark_mode.dart';

import '../../../../common/widgets/appbar/basic_appbar.dart';
import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../register/presentation/screen/register_page.dart';
import '../../../sing_in/presentation/screen/sign_in_page.dart';

class RegisterOrSigninPage extends StatelessWidget {
  const RegisterOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
                AppVectors.topPattern
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
                AppVectors.bottomPattern
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                  AppImages.authBG
              )
          ),

          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        AppVectors.logo
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    const Text(
                      'Enjoy Listening To Music',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const Text(
                      'Unfortunately, you can only listen to a few songs in this mobile app. I\'m really sorry :(',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppColors.lightGrey
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=>  RegisterPage()
                                    )
                                );
                              },
                              title: 'Register'
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=> SigninPage()
                                    )
                                );
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: context.isDarkMode ? Colors.white : Colors.black
                                ),
                              )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}