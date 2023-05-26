import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
