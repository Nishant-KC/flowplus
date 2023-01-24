import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/form_constants.dart';

class BusinessFinancialDetailsModel {
  String? monthlyEarnings;
  String? operatingExpenses;
  String? inventoryServiceCost;
  String? monthlyPayroll;
  String? grossProfitMargin;
  String? costPerUnit;

  BusinessFinancialDetailsModel({
    this.monthlyEarnings,
    this.operatingExpenses,
    this.inventoryServiceCost,
    this.monthlyPayroll,
    this.grossProfitMargin,
    this.costPerUnit,
  });
  factory BusinessFinancialDetailsModel.fromJson(DocumentSnapshot data) {
    Map json = data.data() as Map;
    return BusinessFinancialDetailsModel(
        monthlyEarnings:
            (json[BusinessFinancialsFormConstants.monthlyEarnings]).toString(),
        operatingExpenses:
            (json[BusinessFinancialsFormConstants.operatingExpenses])
                .toString(),
        inventoryServiceCost:
            (json[BusinessFinancialsFormConstants.inventoryServiceCost])
                .toString(),
        monthlyPayroll:
            (json[BusinessFinancialsFormConstants.monthlyPayroll]).toString(),
        grossProfitMargin:
            (json[BusinessFinancialsFormConstants.grossProfitMargin])
                .toString(),
        costPerUnit:
            json[BusinessFinancialsFormConstants.operatingExpenses].toString());
  }

  _getDoubleOfNumber(String? s) {
    return double.tryParse(s ?? "0.0") ?? 0;
  }

  monthlyEarningsMinusPayroll() {
    return _getDoubleOfNumber(monthlyEarnings) -
        _getDoubleOfNumber(monthlyPayroll);
  }

  burnRate() {
    return _getDoubleOfNumber(operatingExpenses) +
        _getDoubleOfNumber(monthlyPayroll);
  }

  breakEvenPointMonth() {
    var counter = burnRate();
    //return
    //   _getDoubleOfNumber(operatingExpenses) +
    //     _getDoubleOfNumber(monthlyPayroll) +
    // _getDoubleOfNumber(s);
    if (breakEvenPointMonth() <= 100000) {
      counter;
    } else {
      counter++;
    }
    return counter;
  }

  // if (counter >= 10) {
  // counter = 1;
  // } else {
  // prefs.setInt('counter', counter++);
  // }
  // prefs.setInt('counter', counter);

}
