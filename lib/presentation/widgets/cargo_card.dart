import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tms/models/cargo_details.dart';

class CargoCard extends StatelessWidget {
  final CargoDetails cargoDetails;

  const CargoCard({super.key, required this.cargoDetails});

  @override
  Widget build(BuildContext context) {
    final avatarInitials = (cargoDetails.dispatcher == null)
        ? "N/A"
        : cargoDetails.dispatcher!
            .substring(0, min(cargoDetails.dispatcher!.length, 2))
            .toUpperCase();
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0x10000000),
          border: Border(
            left: BorderSide(width: 16.0, color: cargoDetails.color),
          ),
          // borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: () {
            //todo
          },
          child: Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: CircleAvatar(
                                child: Text(avatarInitials),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  (cargoDetails.pickupCity != null)
                                      ? cargoDetails.pickupCity!
                                      : "N/A",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            const Icon(Icons.arrow_forward),
                            Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text((cargoDetails.deliveryCity != null)
                                    ? cargoDetails.deliveryCity!
                                    : "N/A"),
                              ),
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("${cargoDetails.broker}")
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text((cargoDetails.loadNumberInternal != null)
                              ? cargoDetails.loadNumberInternal!
                              : "N/A"),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text((cargoDetails.loadNumber != null)
                              ? cargoDetails.loadNumber!
                              : "N/A"),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text((cargoDetails.amount != null)
                              ? cargoDetails.amount!
                              : "N/A"),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
