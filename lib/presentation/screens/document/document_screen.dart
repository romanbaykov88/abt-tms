import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:tms/presentation/screens/document/document_arguments.dart';
import 'package:tms/logic/blocs/document_file/document_file_cubit.dart';
import 'package:tms/presentation/screens/document/sheet_screen_arguments.dart';

class DocumentScreen extends StatelessWidget {
  final DocumentArguments arguments;

  const DocumentScreen({super.key, required this.arguments});

  static const routeName = '/document';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DocumentFileCubit>(context).openFile(arguments.file);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document page'),
      ),
      body: BlocBuilder<DocumentFileCubit, DocumentFileState>(
        builder: (context, state) {
          return state.when(
            (Spreadsheet? sheetsFile) {
              if (arguments.sheetName != null) {
                return Text("${arguments.sheetName}");
              }
              final sheets = sheetsFile?.sheets;
              if (sheets != null) {
                return ListView(
                  children: sheets
                      .map((sheet) => TextButton(
                          onPressed: () =>
                              {
                                Navigator.of(context).pushNamed('/sheet', arguments: SheetScreenArguments(fileId: "${arguments.file.id}", sheetTitle: "${sheet.properties!.title}"))
                              },
                          child: Text("${sheet.properties!.title}")))
                      .toList(),
                );
              }
              return const Text("no sheets");
            },
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
