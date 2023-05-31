import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/presentation/screens/sheet_select_screen/sheet_list.dart';

class SheetSelectScreen extends StatelessWidget {
  const SheetSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login screen'),
        ),
        body: Wrap(children: <Widget>[
          TextButton(
            onPressed: () {
              BlocProvider.of<GoogleAuthCubit>(context).signIn();
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<GoogleAuthCubit>(context).signOut();
            },
            child: const Text('Logout'),
          ),
          BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
              builder: (context, GoogleAuthState state) {
            return state.when((account, client) {
              if (account == null) {
                return const Text('Logged out...');
              }
              return Column(
                children: [
                  Text("${account.displayName}"),
                  const SheetList(),
                ],
              );
            },
                initial: (client) => const Text('Initialisation ...'),
                loading: (client) => const Text('Loading ...'));
          })
        ]));
  }
}
