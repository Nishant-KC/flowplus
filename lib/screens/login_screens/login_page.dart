import 'package:flow_plus/constants/form_constants.dart';
import 'package:flow_plus/constants/form_field_hint_constants.dart';
import 'package:flow_plus/constants/hive_constants.dart';
import 'package:flow_plus/data/controllers/login_page_controller.dart';
import 'package:flow_plus/data/helpers/authentication_helper.dart';
import 'package:flow_plus/data/helpers/business_collection_helper.dart';
import 'package:flow_plus/data/helpers/user_collection_helper.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/screens/business_screens/business_profile_page.dart';
import 'package:flow_plus/screens/user_screens/user_profile_page.dart';
import 'package:flow_plus/screens/user_screens/user_registration_form.dart';
import 'package:flow_plus/widgets/_common/custom_button.dart';
import 'package:flow_plus/widgets/_common/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../widgets/_common/login_user_type_selection_radio.dart';
import '../business_screens/business_reg_form.dart';
//import 'package:myApp/password.dart';

class LoginPage extends GetView<LoginPageController> {
  LoginPage({Key? key}) : super(key: key);
  final loginController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    // _insertUsers(context);
    // _insertBusiness(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: FormBuilder(
        key: loginController.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: <Widget>[
            LoginUserTypeSelctionRadio(),
            CustomFormField(
              name: LoginFormConstants.email,
              hint: FormFieldHintsContants.email,
              isEmail: true,
              initialText: "test@gmail.com",
              isRequired: true,
            ),
            CustomFormField(
              name: LoginFormConstants.password,
              isHidden: true,
              hint: FormFieldHintsContants.password,
              initialText: "1234556",
              isRequired: true,
              maxChars: 8,
            ),
            const SizedBox(height: 24.0),
            Obx(
              () => CustomButton(
                title: "Login",
                onPressed: _handleSignIn,
                showLoader: loginController.isLoading.value,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSignIn() async {
    if (loginController.formKey.currentState!.validate()) {
      loginController.updateLoading(true);
      loginController.formKey.currentState!.save();
      Map values = loginController.formKey.currentState!.value;
      int? user = await AuthenticationHelper().loginOrRegister(
        email: values[LoginFormConstants.email],
        password: values[LoginFormConstants.password],
        context: Get.context!,
      );

      loginController.updateLoading(false);

      if ((user ?? 0) != 0) {
        Hive.box(HiveConstants.boxName).put(
            HiveConstants.typeOfUser, loginController.typeOfUser.value.index);
        UserOrBusinessProvider userProvider =
            Provider.of<UserOrBusinessProvider>(Get.context!, listen: false);

        if (loginController.typeOfUser.value == TypeOfUser.business) {
          if (await BusinessCollectionHelper()
              .checkIfABusinessIdExists(userID: userProvider.uid ?? "")) {
            userProvider.assignFinanceDetails(await BusinessCollectionHelper()
                .getFinancialDetails(userId: userProvider.uid ?? ""));
            userProvider.assignBusinessDetails(await BusinessCollectionHelper()
                .getBusinessDetails(userId: userProvider.uid ?? ""));
            Get.offAll(() => const BusinessProfilePage());
          } else {
            Get.offAll(() => const BusinessRegistrationForm());
          }
        } else {
          if (await UserCollectionHelper()
              .checkIfAUserIdExisitsOrNot(userID: userProvider.uid ?? "")) {
            userProvider.assignUserDetails(await UserCollectionHelper()
                .getUserDetails(userId: userProvider.uid ?? ""));
            Get.offAll(() => const UserProfilePage());
          } else {
            Get.offAll(() => const UserRegistrationForm());
          }
        }
      }
    }
  }

//  _insertUsers(context) async {
//     List users = [
//       [
//         "Ray",
//         "Bresh",
//         "password",
//         "email1@gmail.com",
//         "21312 Sunny st. Middleburg AZ 22021",
//         7686876576,
//         75,
//         3.6875,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2016/11/29/03/52/man-1867175_1280.jpg",
//       ],
//       [
//         "Ryan",
//         "Allen",
//         "password",
//         "email2@gmail.com",
//         "21378 Sunny st. Middleburg AZ 22021",
//         5754657987,
//         20,
//         5.6987,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2015/08/31/10/07/man-915230_1280.jpg",
//       ],
//       [
//         "Sara",
//         "Dluew",
//         "password",
//         "email3@gmail.com",
//         "21322 Sunny st. Middleburg AZ 22021",
//         4653545776,
//         10,
//         5.6987,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2017/02/16/23/10/smile-2072907_1280.jpg",
//       ],
//       [
//         "Jay",
//         "Socenny",
//         "password",
//         "email4@gmail.com",
//         "22612 Sunny st. Middleburg AZ 22021",
//         3535253675,
//         30,
//         5.6987,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166__480.jpg",
//       ],
//       [
//         "Aaron",
//         "Asoosh",
//         "password",
//         "email5@gmail.com",
//         "21111 Sunny st. Middleburg AZ 22021",
//         4653554343,
//         40,
//         5.6987,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2018/02/16/14/38/portrait-3157821__480.jpg",
//       ],
//       [
//         "James",
//         "Fanderal",
//         "password",
//         "email6@gmail.com",
//         "21009 Sunny st. Middleburg AZ 22021",
//         6887433645,
//         50,
//         5.6987,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2018/04/27/03/50/portrait-3353699_1280.jpg",
//       ],
//       [
//         "Nancy",
//         "Olliny",
//         "password",
//         "email7@gmail.com",
//         "21889 Sunny st. Middleburg AZ 22021",
//         6977758756,
//         30,
//         5.6987,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2016/11/23/00/31/woman-1851459_1280.jpg",
//       ],
//       [
//         "Billy",
//         "Rebner",
//         "password",
//         "email8@gmail.com",
//         "19112 Sunny st. Middleburg AZ 22021",
//         4687664633,
//         20,
//         5.6987,
//         5.6987,
//         "https://cdn.pixabay.com/photo/2017/06/26/02/47/man-2442565_1280.jpg",
//       ],
//     ];

//     for (List u in users) {
//       await AuthenticationHelper().loginOrRegister(
//         context: Get.context!,
//         email: u[3],
//         password: u[2],
//       );
//       UserProvider? user = Provider.of<UserProvider?>(context, listen: false);
//       UserCollectionHelper()
//           .addUserDetails(userID: user?.user?.uid ?? "", userDetails: {
//         "first_name": u[0],
//         "last_name": u[1],
//         "email": u[3],
//         "address": u[4],
//         "contact": u[5],
//         "search_radius": u[6],
//         "lat": u[7],
//         "lng": u[8],
//         "image": u[9],
//       });
//     }
//   }

  // _insertBusiness(context) async {
  //   List users = [
  //     [
  //       "ABC Industries",
  //       "234 Bilt rd Ashburn VA 22322",
  //       0,
  //       "email@email11.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2018/08/18/12/01/money-3614661__340.png",
  //     ],
  //     [
  //       "XYZ Industries",
  //       "213 Graham rd Ashburn VA 22322",
  //       0,
  //       "email@email12.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2016/12/05/21/08/cologne-1884931__340.jpg",
  //     ],
  //     [
  //       "New Floors",
  //       "999 Way rd Ashburn VA 22322",
  //       0,
  //       "email@email13.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2016/09/19/17/20/home-1680800__340.jpg",
  //     ],
  //     [
  //       "The Deli",
  //       "898 Rainy rd Ashburn VA 22322",
  //       0,
  //       "email@email14.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2016/09/19/17/20/home-1680800__340.jpg",
  //     ],
  //     [
  //       "Dogg Walkers",
  //       "221 Ester rd Ashburn VA 22322",
  //       0,
  //       "email@email15.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2018/02/04/21/13/monastery-3130879__340.jpg",
  //     ],
  //     [
  //       "Molly Maid",
  //       "118 Deler rd Ashburn VA 22322",
  //       0,
  //       "email@email16.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2016/09/19/17/20/home-1680800__340.jpg",
  //     ],
  //     [
  //       "Cleaners R Us",
  //       "313 Hilltop rd Ashburn VA 22322",
  //       0,
  //       "email@email17.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2020/04/22/12/03/cleaning-5077743__340.jpg",
  //     ],
  //     [
  //       "BBQ Pit",
  //       "657 Fort rd Ashburn VA 22322",
  //       0,
  //       "email@email18.com",
  //       "password",
  //       "https://cdn.pixabay.com/photo/2016/09/19/17/20/home-1680800__340.jpg",
  //     ],
  //   ];
  //   for (List u in users) {
  //     await AuthenticationHelper().loginOrRegister(
  //       context: Get.context!,
  //       email: u[3],
  //       password: u[4],
  //     );
  //     UserProvider? user = Provider.of<UserProvider?>(context, listen: false);
  //     BusinessCollectionHelper()
  //         .addBusinessDetails(userID: user?.user?.uid ?? "", businessDetails: {
  //       "business_name": u[0],
  //       "email": u[3],
  //       "address": u[1],
  //       "contact": u[2],
  //       "image": u[5],
  //     });
  //   }
  // }

}
