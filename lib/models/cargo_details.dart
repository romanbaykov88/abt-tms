import 'package:flutter/painting.dart' as Painting;
import 'package:googleapis/sheets/v4.dart';

class CargoDetails {
  final int index;
  RowData rowData;
  final Painting.Color color;

  String? get washingtonDate { return rowData.values?[0].formattedValue; }
  String? get washingtonTime { return rowData.values?[1].formattedValue; }
  String? get washingtonAddress { return rowData.values?[2].formattedValue; }
  String? get washingtonStatus { return rowData.values?[3].formattedValue; }
  String? get loadNumberInternal { return rowData.values?[5].formattedValue; }
  String? get companyName { return rowData.values?[7].formattedValue; }
  String? get dispatcher { return rowData.values?[8].formattedValue; }
  String? get broker { return rowData.values?[9].formattedValue; }
  String? get pickupDriver { return rowData.values?[10].formattedValue; }
  String? get containerNumber { return rowData.values?[12].formattedValue; }
  String? get pickupDate { return rowData.values?[13].formattedValue; }
  String? get pickupTime { return rowData.values?[14].formattedValue; }
  String? get pickupCity { return rowData.values?[15].formattedValue; }
  String? get weight { return rowData.values?[16].formattedValue; }
  String? get loadNumber { return rowData.values?[19].formattedValue; }
  String? get amount { return rowData.values?[22].formattedValue; }
  String? get deliveryDriver { return rowData.values?[27].formattedValue; }
  String? get deliveryDate { return rowData.values?[28].formattedValue; }
  String? get deliveryTime { return rowData.values?[29].formattedValue; }
  String? get deliveryCity { return rowData.values?[30].formattedValue; }

  set washingtonDate(String? value){ rowData.values?[0].formattedValue = value;}
  set washingtonTime(String? value){ rowData.values?[1].formattedValue = value;}
  set washingtonAddress(String? value){ rowData.values?[2].formattedValue = value;}
  set washingtonStatus(String? value){ rowData.values?[3].formattedValue = value;}
  set loadNumberInternal(String? value){ rowData.values?[5].formattedValue = value;}
  set companyName(String? value){ rowData.values?[7].formattedValue = value;}
  set dispatcher(String? value){ rowData.values?[8].formattedValue = value;}
  set broker(String? value){ rowData.values?[9].formattedValue = value;}
  set pickupDriver(String? value){ rowData.values?[10].formattedValue = value;}
  set containerNumber(String? value){ rowData.values?[12].formattedValue = value;}
  set pickupDate(String? value){ rowData.values?[13].formattedValue = value;}
  set pickupTime(String? value){ rowData.values?[14].formattedValue = value;}
  set pickupCity(String? value){ rowData.values?[15].formattedValue = value;}
  set weight(String? value){ rowData.values?[16].formattedValue = value;}
  set loadNumber(String? value){ rowData.values?[19].formattedValue = value;}
  set amount(String? value){ rowData.values?[22].formattedValue = value;}
  set deliveryDriver(String? value){ rowData.values?[27].formattedValue = value;}
  set deliveryDate(String? value){ rowData.values?[28].formattedValue = value;}
  set deliveryTime(String? value){ rowData.values?[29].formattedValue = value;}
  set deliveryCity(String? value){ rowData.values?[30].formattedValue = value;}

  static transformColor(Color? rgbColor) {
    Painting.Color color = Painting.Color.fromRGBO(
        ((rgbColor!.red ?? 0) * 255).round(),
        ((rgbColor.green ?? 0) * 255).round(),
        ((rgbColor.blue ?? 0) * 255).round(),
        1);
    return color;
  }

  CargoDetails.fromGrid(RowData row, int i)
      : index = i,
        rowData = row,
        color = CargoDetails.transformColor(
            row.values?[0].effectiveFormat?.backgroundColorStyle?.rgbColor);
}
