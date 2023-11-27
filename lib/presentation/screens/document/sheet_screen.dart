import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tms/logic/blocs/sheet/sheet_cubit.dart';
import 'package:tms/models/cargo_details.dart';
import 'package:tms/presentation/screens/document/editor_screen_arguments.dart';
import 'package:tms/presentation/screens/document/sheet_screen_arguments.dart';
import 'package:tms/presentation/widgets/cargo_card.dart';

class SheetScreen extends StatefulWidget {
  final SheetScreenArguments arguments;

  const SheetScreen({super.key, required this.arguments});

  @override
  State<SheetScreen> createState() => _SheetScreenState();
}

class _SheetScreenState extends State<SheetScreen> {
  String? nameFilter;
  Color? colorFilter;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SheetCubit>(context)
        .loadSheet(widget.arguments.fileId, widget.arguments.sheetTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(widget.arguments.sheetTitle),
      ),
      body: BlocBuilder<SheetCubit, SheetState>(
        builder: (context, state) {
          return state.when(
            (sheet) {
              int rowIndex = 0;
              List<CargoDetails> cargoDetails = sheet!.data![0].rowData!
                  .map((row) => CargoDetails.fromGrid(row, rowIndex++))
                  .where((cargo) => cargo.pickupCity != null && cargo.deliveryCity != null)
                  .toList();

              List<String> dispatcherList = cargoDetails
                  .where((cargo) => cargo.dispatcher != null)
                  .map((e) => e.dispatcher.toString())
                  .toSet()
                  .toList();

              List<String> statusList = cargoDetails
                  .where((cargo) => cargo.washingtonStatus != null)
                  .map((e) => e.washingtonStatus.toString())
                  .toSet()
                  .toList();

              List<String> brokerList = cargoDetails
                  .where((cargo) => cargo.broker != null)
                  .map((e) => e.broker.toString())
                  .toSet()
                  .toList();

              List<String> companyList = cargoDetails
                  .where((cargo) => cargo.companyName != null)
                  .map((e) => e.companyName.toString())
                  .toSet()
                  .toList();

              List<DropdownMenuItem<String>> dispatcherMenuItems =
                  dispatcherList.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();

              dispatcherMenuItems.insert(
                  0,
                  const DropdownMenuItem(
                    value: null,
                    child: Text('All dispatchers'),
                  ));

              List<Color> colorList =
                  cargoDetails.map((e) => e.color).toSet().toList();

              List<DropdownMenuItem<Color>> colorMenuItems =
                  colorList.map((color) {
                return DropdownMenuItem<Color>(
                  value: color,
                  child: Container(
                      alignment: Alignment.center,
                      child: Icon(Icons.circle, color: color)),
                );
              }).toList();

              colorMenuItems.insert(
                  0,
                  DropdownMenuItem(
                      value: null,
                      child: Container(
                        alignment: Alignment.center,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => const LinearGradient(
                            colors: [
                              Color(0xfff32e20),
                              Color(0xffffef62),
                              Color(0xffffef62),
                              Color(0xff3cd743),
                              Color(0xff3cd743),
                              Color(0xff2095f3),
                              Color(0xff2095f3),
                              Color(0xffbe3ed4),
                              Color(0xffbe3ed4)
                            ],
                            stops: [0.2, 0.2, 0.4, 0.4, 0.6, 0.6, 0.8, 0.8, 1],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds),
                          child: const Icon(
                            Icons.circle,
                          ),
                        ),
                      )));

              bool filterFunc(CargoDetails cargo) {
                //bool result = cargo.pickupCity != null && cargo.deliveryCity != null;
                bool result = true;
                if (nameFilter != null)
                  result &= cargo.dispatcher == nameFilter;
                if (colorFilter != null) result &= cargo.color == colorFilter;
                return result;
              }

              return Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Wrap(
                      spacing: 5,
                      children: [
                        DropdownButton(
                          value: colorFilter,
                          items: colorMenuItems,
                          iconSize: 0.0,
                          //icon: const Visibility(visible:false, child: Icon(Icons.arrow_downward)),
                          onChanged: (Color? value) {
                            setState(() {
                              colorFilter = value;
                            });
                          },
                        ),
                        DropdownButton(
                          value: nameFilter,
                          items: dispatcherMenuItems,
                          icon: const Visibility(
                              visible: false,
                              child: Icon(Icons.arrow_downward)),
                          onChanged: (String? value) {
                            setState(() {
                              nameFilter = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                        children: cargoDetails
                            .where(filterFunc)
                            .map((cargo) => GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/edit',
                                        arguments: EditorScreenArguments(
                                          cargo: cargo,
                                          dispatchers: dispatcherList,
                                          statuses: statusList,
                                          brokers: brokerList,
                                          companies: companyList,
                                          colors: colorList,
                                        ));
                                  },
                                  child: AbsorbPointer(
                                    child: CargoCard(
                                      cargoDetails: cargo,
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                ],
              );
            },
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
