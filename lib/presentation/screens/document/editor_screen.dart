import 'package:flutter/material.dart';
import 'package:tms/models/cargo_details.dart';
import 'package:tms/presentation/screens/document/editor_screen_arguments.dart';
import 'package:flutter/painting.dart' as Painting;

class EditorScreen extends StatefulWidget {
  final EditorScreenArguments arguments;

  const EditorScreen({super.key, required this.arguments});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  CargoDetails? cargo;
  String? status;
  String? dispatcher;
  String? companyName;
  Painting.Color? color;
  String? broker;
  String? loadNumber;
  String? loadNumberInternal;
  String? weight;
  String? amount;
  String? pickupDate;
  String? pickupTime;
  String? pickupDriver;
  String? pickupCity;
  String? deliveryDate;
  String? deliveryTime;
  String? deliveryDriver;
  String? deliveryCity;
  String? washingtonDate;
  String? washingtonTime;
  String? washingtonAddress;

  @override
  initState() {
    super.initState();
    setState(() {
      cargo = widget.arguments.cargo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text('editor screen'),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: DropdownMenu(
                                expandedInsets: EdgeInsets.zero,
                                label: const Text('Status'),
                                initialSelection:
                                    widget.arguments.cargo.washingtonStatus,
                                onSelected: (String? value) {
                                  setState(() {
                                    status = value;
                                  });
                                },
                                dropdownMenuEntries: widget.arguments.statuses
                                    .map((status) => DropdownMenuEntry<String>(
                                          value: status,
                                          label: status,
                                        ))
                                    .toList(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: DropdownMenu(
                                expandedInsets: EdgeInsets.zero,
                                label: const Text('Dispatcher'),
                                initialSelection:
                                    widget.arguments.cargo.dispatcher,
                                onSelected: (String? value) {
                                  setState(() {
                                    dispatcher = value;
                                  });
                                },
                                dropdownMenuEntries: widget
                                    .arguments.dispatchers
                                    .map((dispatcher) =>
                                        DropdownMenuEntry<String>(
                                          value: dispatcher,
                                          label: dispatcher,
                                        ))
                                    .toList(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: DropdownMenu(
                                expandedInsets: EdgeInsets.zero,
                                label: const Text('Company name'),
                                initialSelection:
                                    widget.arguments.cargo.companyName,
                                onSelected: (String? value) {
                                  setState(() {
                                    companyName = value;
                                  });
                                },
                                dropdownMenuEntries: widget.arguments.companies
                                    .map((company) => DropdownMenuEntry<String>(
                                          value: company,
                                          label: company,
                                        ))
                                    .toList(),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Weight',
                                  ),
                                  initialValue: widget.arguments.cargo.weight,
                                  onChanged: (String? value) {
                                    setState(() {
                                      weight = value;
                                    });
                                  },
                                )),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Load #',
                                  ),
                                  initialValue:
                                      widget.arguments.cargo.loadNumber,
                                  onChanged: (String? value) {
                                    setState(() {
                                      loadNumber = value;
                                    });
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: DropdownMenu<Painting.Color>(
                                expandedInsets: EdgeInsets.zero,
                                label: const Text('Color'),
                                initialSelection: widget.arguments.cargo.color,
                                onSelected: (Painting.Color? value) {
                                  setState(() {
                                    color = value;
                                  });
                                },
                                dropdownMenuEntries: widget.arguments.colors
                                    .map((color) =>
                                        DropdownMenuEntry<Painting.Color>(
                                          value: color,
                                          label: color.toString(),
                                          labelWidget: Container(
                                              alignment: Alignment.center,
                                              child: Icon(Icons.circle,
                                                  color: color)),
                                        ))
                                    .toList(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: DropdownMenu(
                                expandedInsets: EdgeInsets.zero,
                                label: const Text('Broker'),
                                initialSelection: widget.arguments.cargo.broker,
                                onSelected: (String? value) {
                                  setState(() {
                                    broker = value;
                                  });
                                },
                                dropdownMenuEntries: widget.arguments.brokers
                                    .map((broker) => DropdownMenuEntry<String>(
                                          value: broker,
                                          label: broker,
                                        ))
                                    .toList(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Load number (internal)',
                                ),
                                initialValue:
                                    widget.arguments.cargo.loadNumberInternal,
                                onChanged: (String? value) {
                                  setState(() {
                                    loadNumberInternal = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Amount',
                                  ),
                                  initialValue: widget.arguments.cargo.amount,
                                  onChanged: (String? value) {
                                    setState(() {
                                      amount = value;
                                    });
                                  },
                                )),
                            // testB(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.file_upload, color: Colors.green.shade500),
                    Text('Pickup'),
                  ],
                ),
                Divider(),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date',
                              ),
                              initialValue: widget.arguments.cargo.pickupDate,
                              onChanged: (String? value) {
                                setState(() {
                                  pickupDate = value;
                                });
                              },
                            )),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Driver',
                              ),
                              initialValue: widget.arguments.cargo.pickupDriver,
                              onChanged: (String? value) {
                                setState(() {
                                  pickupDriver = value;
                                });
                              },
                            )),
                      ],
                    ),
                  )),
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Time',
                              ),
                              initialValue: widget.arguments.cargo.pickupTime,
                              onChanged: (String? value) {
                                setState(() {
                                  pickupTime = value;
                                });
                              },
                            )),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'City',
                              ),
                              initialValue: widget.arguments.cargo.pickupCity,
                              onChanged: (String? value) {
                                setState(() {
                                  pickupCity = value;
                                });
                              },
                            )),
                      ],
                    ),
                  )),
                ]),
                Row(
                  children: [
                    Icon(Icons.file_download, color: Colors.yellow.shade900),
                    Text('Delivery'),
                  ],
                ),
                Divider(),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date',
                              ),
                              initialValue: widget.arguments.cargo.deliveryDate,
                              onChanged: (String? value) {
                                setState(() {
                                  deliveryDate = value;
                                });
                              },
                            )),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Driver',
                              ),
                              initialValue:
                                  widget.arguments.cargo.deliveryDriver,
                              onChanged: (String? value) {
                                setState(() {
                                  deliveryDriver = value;
                                });
                              },
                            )),
                      ],
                    ),
                  )),
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Time',
                              ),
                              initialValue: widget.arguments.cargo.deliveryTime,
                              onChanged: (String? value) {
                                setState(() {
                                  deliveryTime = value;
                                });
                              },
                            )),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'City',
                              ),
                              initialValue: widget.arguments.cargo.deliveryCity,
                              onChanged: (String? value) {
                                setState(() {
                                  deliveryCity = value;
                                });
                              },
                            )),
                      ],
                    ),
                  )),
                ]),
                Row(
                  children: [
                    Icon(Icons.warehouse, color: Colors.blue.shade800),
                    Text('Washington WH'),
                  ],
                ),
                Divider(),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date',
                              ),
                              initialValue:
                                  widget.arguments.cargo.washingtonDate,
                              onChanged: (String? value) {
                                setState(() {
                                  washingtonDate = value;
                                });
                              },
                            )),
                      ],
                    ),
                  )),
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Time',
                              ),
                              initialValue:
                                  widget.arguments.cargo.washingtonTime,
                              onChanged: (String? value) {
                                setState(() {
                                  washingtonTime = value;
                                });
                              },
                            )),
                      ],
                    ),
                  )),
                ]),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                      ),
                      initialValue: widget.arguments.cargo.washingtonAddress,
                      onChanged: (String? value) {
                        setState(() {
                          washingtonAddress = value;
                        });
                      },
                    )),
                Divider(),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                    )),
              ],
            ),
          ),
        ));
  }
}

// body: BlocBuilder<EditorCubit, EditorState>(
//     builder: (context, state) {
//       return const Text('editor screen');
//     }
// )
