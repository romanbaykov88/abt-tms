import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/logic/blocs/sheets_list/sheets_list_cubit.dart';

class SheetList extends StatelessWidget {
  const SheetList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SheetsListCubit, SheetsListState>(
      builder: (context, state) {
        return state.when((FileList fileList) {
          final files = fileList.files;
          if (files != null) {
            return Column(
                children: files
                    .map((file) => Text(file.name.toString()))
                    .toList());
          }
          return const Text("no files");
        },
            initial: () => const Text("initial"),
            loading: () => const Text("loading..."),
            error: () => const Text("ERROR"));
      },
    );
  }
// Widget build
}
