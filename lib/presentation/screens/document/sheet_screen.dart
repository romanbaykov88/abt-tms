import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/sheet/sheet_cubit.dart';
import 'package:tms/models/cargo_details.dart';
import 'package:tms/presentation/screens/document/sheet_screen_arguments.dart';
import 'package:tms/presentation/widgets/cargo_card.dart';

class SheetScreen extends StatefulWidget {
  final SheetScreenArguments arguments;

  const SheetScreen({super.key, required this.arguments});

  @override
  State<SheetScreen> createState() => _SheetScreenState();
}

class _SheetScreenState extends State<SheetScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SheetCubit>(context)
        .loadSheet(widget.arguments.fileId, widget.arguments.sheetTitle);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheet page'),
      ),
      body: BlocBuilder<SheetCubit, SheetState>(
        builder: (context, state) {
          return state.when(
            (sheet) {
              return ListView(
                  children: sheet!.data![0].rowData!
                      .map((row) => CargoCard(
                            cargoDetails: CargoDetails.fromGrid(row),
                          ))
                      .toList());
            },
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
