import 'package:filter_list/filter_list.dart';
import 'package:flow_plus/widgets/user_profile_widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<User>? selectedUserList = [];

  Future<void> openFilterDelegate() async {
    await FilterListDelegate.show<User>(
      context: context,
      list: userList,
      selectedListData: selectedUserList,
      theme: FilterListDelegateThemeData(
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: Colors.white,
          selectedColor: Colors.red,
          selectedTileColor: const Color(0xFF649BEC).withOpacity(.5),
          textColor: Colors.blue,
        ),
      ),
      // enableOnlySingleSelection: true,
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      tileLabel: (user) => user!.name,
      emptySearchChild: const Center(child: Text('No user found')),
      // enableOnlySingleSelection: true,
      searchFieldHint: 'Search Here..',
      /*suggestionBuilder: (context, user, isSelected) {
        return ListTile(
          title: Text(user.name!),
          leading: const CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          selected: isSelected,
        );
      },*/
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = list;
        });
      },
    );
  }

  Future<void> _openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Users',
      height: 500,
      listData: userList,
      selectedListData: selectedUserList,
      choiceChipLabel: (item) => item!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      onItemSearch: (user, query) {
        /// When search query change in search bar then this method will be called
        ///
        /// Check if items contains query
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },

      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },

      /// uncomment below code to create custom choice chip
      /* choiceChipBuilder: (context, item, isSelected) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
          )),
          child: Text(
            item.name,
            style: TextStyle(
                color: isSelected ? Colors.blue[300] : Colors.grey[500]),
          ),
        );
      }, */
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title!),
      // ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 30),
      //   child:
      //   TextButton(
      //     onPressed: _openFilterDialog,
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all(Colors.blue),
      //     ),
      //     child: const Text(
      //       "Filter Dialog",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //     // color: Colors.blue,
      //   ),
      //   // Row(
      //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   //   children: <Widget>[
      //   //     // TextButton(
      //   //     //   onPressed: () async {
      //   //     //     final list = await Navigator.push(
      //   //     //       context,
      //   //     //       MaterialPageRoute(
      //   //     //         builder: (context) => FilterPage(
      //   //     //           allTextList: userList,
      //   //     //           selectedUserList: selectedUserList,
      //   //     //         ),
      //   //     //       ),
      //   //     //     );
      //   //     //     if (list != null) {
      //   //     //       setState(() {
      //   //     //         selectedUserList = List.from(list);
      //   //     //       });
      //   //     //     }
      //   //     //   },
      //   //     //   style: ButtonStyle(
      //   //     //     backgroundColor: MaterialStateProperty.all(Colors.blue),
      //   //     //   ),
      //   //     //   child: const Text(
      //   //     //     "Filter Page",
      //   //     //     style: TextStyle(color: Colors.white),
      //   //     //   ),
      //   //     // ),
      //   //     TextButton(
      //   //       onPressed: _openFilterDialog,
      //   //       style: ButtonStyle(
      //   //         backgroundColor: MaterialStateProperty.all(Colors.blue),
      //   //       ),
      //   //       child: const Text(
      //   //         "Filter Dialog",
      //   //         style: TextStyle(color: Colors.white),
      //   //       ),
      //   //       // color: Colors.blue,
      //   //     ),
      //   //     // TextButton(
      //   //     //   onPressed: openFilterDelegate,
      //   //     //   style: ButtonStyle(
      //   //     //     backgroundColor: MaterialStateProperty.all(Colors.blue),
      //   //     //   ),
      //   //     //   child: const Text(
      //   //     //     "Filter Delegate",
      //   //     //     style: TextStyle(color: Colors.white),
      //   //     //   ),
      //   //     //   // color: Colors.blue,
      //   //     // ),
      //   //   ],
      //   // ),
      // ),
      body: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: _openFilterDialog,
                  icon: const Icon(Icons.filter_alt)),
              // TextButton(
              //   onPressed: _openFilterDialog,
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(Colors.blue),
              //   ),
              //   child: const Text(
              //     "Filter",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   // color: Colors.blue,
              // ),
              if (selectedUserList == null || selectedUserList!.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text('Select Filters'),
                  ),
                )
              else
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            selectedUserList![index].name!,
                            style: const TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      );

                      //   ListTile(
                      //   title: Text(selectedUserList![index].name!),
                      // );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: selectedUserList!.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key, this.allTextList, this.selectedUserList})
      : super(key: key);
  final List<User>? allTextList;

  //List<User> allTextList = userList.where((user) => user.id != 10).toList();
  //late int? currentUser = 10;

  final List<User>? selectedUserList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter list Page"),
      ),
      body: SafeArea(
        child: FilterListWidget<User>(
          themeData: FilterListThemeData(context),
          hideSelectedTextCount: true,
          listData: userList,
          selectedListData: selectedUserList,
          onApplyButtonClick: (list) {
            Navigator.pop(context, list);
          },
          choiceChipLabel: (item) {
            /// Used to print text on chip
            return
                //item!.name;
                ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
              return Text(item!.name!);
            }).toString();
          },
          // choiceChipBuilder: (context, item, isSelected) {
          //   return Container(
          //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //       color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
          //     )),
          //     child: Text(item.name),
          //   );
          // },
          validateSelectedItem: (list, val) {
            ///  identify if item is selected or not
            return list!.contains(val);
          },
          onItemSearch: (user, query) {
            /// When search query change in search bar then this method will be called
            ///
            /// Check if items contains query
            return user.name!.toLowerCase().contains(query.toLowerCase());
          },
        ),
      ),
    );
  }
}

class User {
  final String? name;
  final String? avatar;
  final bool isType;
  final int id;
  User({this.name, this.avatar, required this.isType, required this.id});
}

List<User> selectedUserList = [];
//bool doesItContainKey(var name);
Iterable<User> get allNames {
  //var name = userList;
  var r1 = userList.any((item) => item.name == "Carol");
  var r2 = userList.any((item) => item.name == "Abigale");
  //final String name;
  //return [...userList.where((element) => element.name! == "${r1 || r2}")];
  //return [...userList.where((element) => userList.contains(element.name!))];
  //return [...userList.where((element) => element.name == "Carol" || element.name == "Abigale")];
  //return [...userList.where((element) => element.name! == "Carol")];
  return [
    ...userList
        .where((element) => element.name!.contains(selectedUserList.toString()))
        .toList()
  ];
}

/// Creating a global list for example purpose.
/// Generally it should be within data class or where ever you want
List<User> userList = [
  User(name: "Abigail", avatar: "user.png", isType: true, id: 11),
  User(name: "Audrey", avatar: "user.png", isType: false, id: 11),
  User(name: "Ava", avatar: "user.png", isType: true, id: 11),
  User(name: "Bella", avatar: "user.png", isType: false, id: 11),
  User(name: "Bernadette", avatar: "user.png", isType: true, id: 11),
  User(name: "Carol", avatar: "user3.png", isType: false, id: 10),
  User(name: "Carol", avatar: "user2.png", isType: false, id: 10),
  User(name: "Carol", avatar: "user1.png", isType: false, id: 10),
  User(name: "Claire", avatar: "user.png", isType: true, id: 11),
  User(name: "Deirdre", avatar: "user.png", isType: true, id: 11),
  // User(name: "Donna", avatar: "user.png"),
  // User(name: "Dorothy", avatar: "user.png"),
  // User(name: "Faith", avatar: "user.png"),
  // User(name: "Gabrielle", avatar: "user.png"),
  // User(name: "Grace", avatar: "user.png"),
  // User(name: "Hannah", avatar: "user.png"),
  // User(name: "Heather", avatar: "user.png"),
  // User(name: "Irene", avatar: "user.png"),
  // User(name: "Jan", avatar: "user.png"),
  // User(name: "Jane", avatar: "user.png"),
  // User(name: "Julia", avatar: "user.png"),
  // User(name: "Kylie", avatar: "user.png"),
  // User(name: "Lauren", avatar: "user.png"),
  // User(name: "Leah", avatar: "user.png"),
  // User(name: "Lisa", avatar: "user.png"),
  // User(name: "Melanie", avatar: "user.png"),
  // User(name: "Natalie", avatar: "user.png"),
  // User(name: "Olivia", avatar: "user.png"),
  // User(name: "Penelope", avatar: "user.png"),
  // User(name: "Rachel", avatar: "user.png"),
  // User(name: "Ruth", avatar: "user.png"),
  // User(name: "Sally", avatar: "user.png"),
  // User(name: "Samantha", avatar: "user.png"),
  // User(name: "Sarah", avatar: "user.png"),
  // User(name: "Theresa", avatar: "user.png"),
  // User(name: "Una", avatar: "user.png"),
  // User(name: "Vanessa", avatar: "user.png"),
  // User(name: "Victoria", avatar: "user.png"),
  // User(name: "Wanda", avatar: "user.png"),
  // User(name: "Wendy", avatar: "user.png"),
  // User(name: "Yvonne", avatar: "user.png"),
  // User(name: "Zoe", avatar: "user.png"),
];

/// Another example of [FilterListWidget] to filter list of strings
/*
 FilterListWidget<String>(
    listData: [
      "One",
      "Two",
      "Three",
      "Four",
      "five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten"
    ],
    selectedListData: ["One", "Three", "Four", "Eight", "Nine"],
    onApplyButtonClick: (list) {
      Navigator.pop(context, list);
    },
    choiceChipLabel: (item) {
      /// Used to print text on chip
      return item;
    },
    validateSelectedItem: (list, val) {
      ///  identify if item is selected or not
      return list!.contains(val);
    },
    onItemSearch: (text, query) {
      return text.toLowerCase().contains(query.toLowerCase());
    },
  )
*/

class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<User> _AnimatedList = userList.where((i) => i.isType).toList();
  //_AnimatedList = userList.contains((i) => i.name) as List<User>;

  //List.from(userList);

  @override
  void initState() {
    super.initState();
    _AnimatedList = selectedUserList.where((i) => i.isType).toList();
    //_AnimatedList = userList.contains((i) => i.name) as List<User>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: allNames.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  splashColor: Colors.blue.withOpacity(0.9),
                  splashFactory: InkRipple.splashFactory, // this.
                  //overlayColor: overlayColor,
                  //highlightColor: Colors.transparent, // and here
                  highlightColor: Colors.blue.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(25),
                  child: ListTile(
                    leading: const UserAvatar(
                      radius: 60,
                    ),
                    // CircleAvatar(
                    //   backgroundImage:
                    //       AssetImage('assets/images/usr_pwd_icon.jpeg'),
                    // ),
                    title: Text(userList[index].avatar!),
                    //title: Text(_AnimatedList[index].name.toString()),
                    //title: Text(allNames[index].name!),
                    subtitle: Text(userList[index].name!),
                    //subtitle: Text(allNames[index].avatar!),
                    trailing: const Icon(Icons.manage_accounts),
                    tileColor: Colors.white54,
                  ),
                );
              })

          // new Text(
          //     "All Animated Movies here"
          // ),
          ),
      // body: SizedBox(
      //   child: ListView.builder(
      //     //scrollDirection: Axis.horizontal,
      //     shrinkWrap: true,
      //     itemBuilder: (context, index) {
      //       return SizedBox(
      //         height: 50,
      //         child: Card(
      //           elevation: 2,
      //           child: Center(
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Text(selectedUserList[index].name!,style: TextStyle(
      //                   color: Colors.blueAccent
      //               ),),
      //             ),
      //           ),
      //         ),
      //       );
      //
      //       //   ListTile(
      //       //   title: Text(selectedUserList![index].name!),
      //       // );
      //     },
      //     //separatorBuilder: (context, index) => const Divider(),
      //     itemCount: _AnimatedList.length,
      //   ),
      // ),
    );
  }
}

class FilterPageTwo extends StatelessWidget {
  const FilterPageTwo({Key? key, this.allTextList, this.selectedUserList})
      : super(key: key);
  final List<User>? allTextList;
  final List<User>? selectedUserList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Filter list Page"),
      // ),
      body: SafeArea(
        child: FilterListWidget<User>(
          themeData: FilterListThemeData(context),
          hideSelectedTextCount: true,
          listData: userList,
          selectedListData: selectedUserList,
          onApplyButtonClick: (list) {
            Navigator.pop(context, list);
          },
          choiceChipLabel: (item) {
            /// Used to print text on chip
            return item!.name;
          },
          // choiceChipBuilder: (context, item, isSelected) {
          //   return Container(
          //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //       color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
          //     )),
          //     child: Text(item.name),
          //   );
          // },
          validateSelectedItem: (list, val) {
            ///  identify if item is selected or not
            return list!.contains(val);
          },
          onItemSearch: (user, query) {
            /// When search query change in search bar then this method will be called
            ///
            /// Check if items contains query
            return user.isType.toString().contains(query.toLowerCase());
          },
        ),
      ),
    );
  }
}
