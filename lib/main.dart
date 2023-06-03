import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/presentation/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(key: const ValueKey('abt-tms'), appRouter: AppRouter()));
}

// // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
// final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
//
// assert(client != null, 'Authenticated client missing!');
//
// // Prepare a People Service authenticated client.
// final SheetsApi peopleApi = SheetsApi(client!);
// final DriveApi driveApi = DriveApi(client);
// final filesList = await driveApi.files.list(
// q: 'mimeType = \'application/vnd.google-apps.spreadsheet\'',
// pageSize: 100);
// for (var file in filesList.files!) {
// log('${file.name} ${file.id}');
// }

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required Key key,
    required this.appRouter,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleAuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
