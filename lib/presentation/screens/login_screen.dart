import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/transport_tile.png",
            repeat: ImageRepeat.repeat,
          ),
        ),
        BlocListener<GoogleAuthCubit, GoogleAuthState>(
          listener: (context, state) {
            state.when((account, client, headers) {
              if (account != null) {
                Navigator.of(context).pushReplacementNamed('/select');
              }
            }, initial: (client) {}, loading: (client) {});
          },
          child: Container(),
        )
      ],
    );
  }
}
