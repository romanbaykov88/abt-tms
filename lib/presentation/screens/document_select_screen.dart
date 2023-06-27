import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/presentation/widgets/document_list.dart';

class DocumentSelectScreen extends StatelessWidget {
  const DocumentSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Document select'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
                BlocProvider.of<GoogleAuthCubit>(context).signIn();
                break;
              case 1:
                BlocProvider.of<GoogleAuthCubit>(context).signOut();
                break;
              default:
                break;
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'SignOut',
            ),
          ],
        ),
        body: const DocumentList());
  }
}
