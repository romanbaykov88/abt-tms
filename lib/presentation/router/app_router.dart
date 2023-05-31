import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/sheets_list/sheets_list_cubit.dart';
import 'package:tms/presentation/screens/login_screen.dart';
import 'package:tms/presentation/screens/sheet_select_screen.dart';

import '../../logic/blocs/authentication/google_auth_cubit.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/select':
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (_) => SheetsListCubit(BlocProvider.of<GoogleAuthCubit>(context)),
                child: const SheetSelectScreen(),
              ),
        );
      case '/':
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }
}
