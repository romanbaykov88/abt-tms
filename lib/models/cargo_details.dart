import 'package:flutter/painting.dart' as Painting;
import 'package:googleapis/sheets/v4.dart';

class CargoDetails {
  final String? washingtonDate;
  final String? washingtonTime;
  final String? washingtonAddress;
  final String? washingtonStatus;
  final String? loadNumberInternal;
  final String? companyName;
  final String? dispatcher;
  final String? broker;
  final String? pickupDriver;
  final String? containerNumber;
  final String? pickupDate;
  final String? pickupTime;
  final String? pickupCity;
  final String? weight;
  final String? loadNumber;
  final String? amount;
  final String? deliveryDate;
  final String? deliveryTime;
  final String? deliveryCity;
  final Painting.Color color;

  static transformColor(Color? rgbColor){
    Painting.Color color = Painting.Color.fromRGBO(
        ((rgbColor!.red ?? 0) * 255).round(),
        ((rgbColor.green ?? 0) * 255).round(),
        ((rgbColor.blue ?? 0) * 255).round(),
        1);
    return color;
  }

  CargoDetails.fromGrid(RowData row)
      : washingtonDate = row.values?[0].formattedValue,
        washingtonTime = row.values?[1].formattedValue,
        washingtonAddress = row.values?[2].formattedValue,
        washingtonStatus = row.values?[3].formattedValue,
        loadNumberInternal = row.values?[5].formattedValue,
        companyName = row.values?[7].formattedValue,
        dispatcher = row.values?[8].formattedValue,
        broker = row.values?[9].formattedValue,
        pickupDriver = row.values?[10].formattedValue,
        containerNumber = row.values?[12].formattedValue,
        pickupDate = row.values?[13].formattedValue,
        pickupTime = row.values?[14].formattedValue,
        pickupCity = row.values?[15].formattedValue,
        weight = row.values?[16].formattedValue,
        loadNumber = row.values?[19].formattedValue,
        amount = row.values?[22].formattedValue,
        deliveryDate = row.values?[28].formattedValue,
        deliveryTime = row.values?[29].formattedValue,
        deliveryCity = row.values?[30].formattedValue,
        color = CargoDetails.transformColor(row.values?[0].effectiveFormat?.backgroundColorStyle?.rgbColor);
}
