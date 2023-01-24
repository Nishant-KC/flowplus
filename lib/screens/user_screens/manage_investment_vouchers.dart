import 'package:flow_plus/screens/user_screens/redeem_value_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Business $index',
      expandedValue: 'Show vouchers and Invest details $index',
    );
  });
}

class ManageInvestmentVouchers extends StatefulWidget {
  const ManageInvestmentVouchers({Key? key}) : super(key: key);

  @override
  State<ManageInvestmentVouchers> createState() =>
      _ManageInvestmentVouchersState();
}

class _ManageInvestmentVouchersState extends State<ManageInvestmentVouchers> {
  final List<Item> _data = generateItems(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: _buildPanel()),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: InkWell(
                  onTap: () {
                    Get.to(() => RedeemValuePage());
                  },
                  child: Text(item.expandedValue)),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
