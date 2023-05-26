import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/presentation/screens/login_screen.dart';
import 'package:tms/presentation/screens/sheet_select_screen.dart';

class AppRouter {
  final GoogleAuthCubit _authCubit = GoogleAuthCubit();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/select':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authCubit,
            child: const SheetSelectScreen(),
          ),
        );
      case '/':
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authCubit,
            child: const LoginScreen(),
          ),
        );

    }
  }

  void dispose() {
    _authCubit.close();
  }
}
