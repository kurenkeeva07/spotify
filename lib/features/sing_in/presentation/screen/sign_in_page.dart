import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/widgets/appbar/basic_appbar.dart';
import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../service_locator.dart';
import '../../../auth/data/models/sign_in_user.dart';
import '../../../auth/domain/usecase/sigin.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../home/services/song_handler.dart';
import '../../../register/presentation/screen/register_page.dart';

SongHandler _songHandler = SongHandler();

Future<void> sign() async {
  WidgetsFlutterBinding.ensureInitialized();
  _songHandler = await AudioService.init(
    builder: () => SongHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.dum.app',
      androidNotificationChannelName: 'Dum Player',
      androidNotificationOngoing: true,
      androidShowNotificationBadge: true,
    ),
  );
}

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: _signupText(context),
        appBar: BasicAppbar(
          title: SvgPicture.asset(
            AppVectors.logo,
            height: 40,
            width: 40,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 30
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 50,),
              _emailField(context),
              const SizedBox(height: 20,),
              _passwordField(context),
              const SizedBox(height: 20,),
              BasicAppButton(
                  onPressed: () async {
                    var result = await getIt<SigninUseCase>().call(
                        params: SigninUser(
                            email: _email.text.toString(),
                            password: _password.text.toString()
                        )
                    );
                    result.fold(
                            (l) {
                          var snackbar = SnackBar(content: Text(l),
                            behavior: SnackBarBehavior.floating,);
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                            (r) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage(songHandler: _songHandler,)),
                                  (route) => false
                          );
                        }
                    );
                  },
                  title: 'Sign In'
              )

            ],
          ),
        ),
      );
    }

    Widget _registerText() {
      return const Text(
        'Sign In',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),
        textAlign: TextAlign.center,
      );
    }


    Widget _emailField(BuildContext context) {
      return TextField(
        controller: _email,
        decoration: const InputDecoration(
            hintText: 'Enter Email'
        ).applyDefaults(
            Theme
                .of(context)
                .inputDecorationTheme
        ),
      );
    }

    Widget _passwordField(BuildContext context) {
      return TextField(
        controller: _password,
        decoration: const InputDecoration(
            hintText: 'Password'
        ).applyDefaults(
            Theme
                .of(context)
                .inputDecorationTheme
        ),
      );
    }

    Widget _signupText(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 30
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Not A Member? ',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RegisterPage()
                    ),
                  );
                },
                child: const Text(
                    'Register Now'
                )
            )
          ],
        ),
      );
    }
}