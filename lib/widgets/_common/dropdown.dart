// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
//
// class DropDown extends StatelessWidget {
//   final GlobalKey fbKey;
//   final String attribute, labelText;
//   final List<String> itemsList;
//
//   const DropDown({
//     Key? key,
//     required this.fbKey,
//     required this.attribute,
//     required this.labelText,
//     required this.itemsList,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return FormBuilder(
//       key: fbKey,
//       autovalidateMode: AutovalidateMode.always,
//       initialValue: const {
//         'country': 5,
//       },
//       child: FormBuilderCustomField
//         (
//         attribute: attribute,
//         validators: [
//           FormBuilderValidators.required(),
//         ],
//         formField: FormField(
//           // key: _fieldKey,
//           enabled: true,
//           builder: (FormFieldState<dynamic> field) {
//             return InputDecorator(
//               decoration: InputDecoration(
//                 labelText: labelText,
//                 contentPadding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
//                 border: InputBorder.none,
//                 errorText: field.errorText,
//               ),
//               child: DropdownButton(
//                 isExpanded: true,
//                 items: itemsList.map((option) {
//                   return DropdownMenuItem(
//                     value: option,
//                     child: Text(option),
//                   );
//                 }).toList(),
//                 value: field.value,
//                 onChanged: (value) {
//                   field.didChange(value);
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // DropDown(
// // fbKey: _bfKey,
// // attribute: 'Name',
// // labelText: 'Select Country',
// // itemsList: ['One', 'Two'],
// // ),

import 'package:flutter/material.dart';

Map<String, String> cities = <String, String>{
  'New York': 'NYC',
  'Los Angeles': 'LA',
  'San Francisco': 'SF',
  'Chicago': 'CH',
  'Miami': 'MI',
};

//void main() => runApp(const DropdownButtonApp());

// class DropdownButtonApp extends StatelessWidget {
//   const DropdownButtonApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('DropdownButton Sample')),
//         body: const Center(child: DropdownButtonExample()),
//       ),
//     );
//   }
// }

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String selectedItem = cities.keys.first;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Select a city:', style: Theme.of(context).textTheme.bodyLarge),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: selectedItem,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() => selectedItem = value!);
              },
              selectedItemBuilder: (BuildContext context) {
                return cities.values.map<Widget>((String item) {
                  // This is the widget that will be shown when you select an item.
                  // Here custom text style, alignment and layout size can be applied
                  // to selected item string.
                  return Container(
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(minWidth: 100),
                    child: Text(
                      item,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList();
              },
              items: cities.keys.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

