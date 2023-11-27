import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/editor/editor_cubit.dart';
import 'package:tms/logic/blocs/sheet/sheet_cubit.dart';
import 'package:tms/presentation/screens/document/document_screen.dart';
import 'package:tms/presentation/screens/document/document_arguments.dart';
import 'package:tms/presentation/screens/document/editor_screen.dart';
import 'package:tms/presentation/screens/document/editor_screen_arguments.dart';
import 'package:tms/presentation/screens/document/sheet_screen.dart';
import 'package:tms/presentation/screens/document/sheet_screen_arguments.dart';
import 'package:tms/presentation/screens/error.dart';
import 'package:tms/presentation/screens/login_screen.dart';
import 'package:tms/presentation/screens/document_select_screen.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/logic/blocs/documents_list/documents_list_cubit.dart';
import 'package:tms/logic/blocs/document_file/document_file_cubit.dart';

class AppRouter {
  static GlobalKey<NavigatorState> primaryRouterKey = GlobalKey();
  static GlobalKey<NavigatorState> documentRouterKey = GlobalKey();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/select':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) =>
                DocumentsListCubit(BlocProvider.of<GoogleAuthCubit>(context)),
            child: const DocumentSelectScreen(),
          ),
        );
      case DocumentScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          if (settings.arguments != null) {
            return BlocProvider(
              create: (context) =>
                  DocumentFileCubit(BlocProvider.of<GoogleAuthCubit>(context)),
              child: Navigator(
                key: AppRouter.documentRouterKey,
                onGenerateRoute: (RouteSettings documentRouteSettings) {
                  switch (documentRouteSettings.name) {
                    case '/sheet':
                      return MaterialPageRoute(builder: (context) {
                        return BlocProvider(
                          create: (context) => SheetCubit(
                              googleAuthCubit:
                                  BlocProvider.of<GoogleAuthCubit>(context)),
                          child: SheetScreen(
                            arguments: documentRouteSettings.arguments
                                as SheetScreenArguments,
                          ),
                        );
                      });
                    case '/edit':
                      return MaterialPageRoute(builder: (context) {
                        return BlocProvider(
                          create: (context) => EditorCubit(),
                          child: EditorScreen(
                            arguments: documentRouteSettings.arguments
                                as EditorScreenArguments,
                          ),
                        );
                      });
                    case '/sheets':
                    default:
                      return MaterialPageRoute(builder: (context) {
                        return DocumentScreen(
                          arguments: settings.arguments as DocumentArguments,
                        );
                      });
                  }
                },
              ),
              // child: Document(
              //   arguments: settings.arguments as DocumentArguments,
              // ),
            );
          }
          return const ErrorPage();
        });
      case '/':
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }
}
