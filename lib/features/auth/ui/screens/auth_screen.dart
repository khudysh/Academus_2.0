import 'package:academus_2/core/router/routes.dart';
import 'package:academus_2/core/theme/const.dart';
import 'package:academus_2/core/ui/widgets/form_button.dart';
import 'package:academus_2/core/ui/widgets/form_field.dart';
import 'package:academus_2/features/auth/domain/providers/login_controller_provider.dart';
import 'package:academus_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AuthScreen extends ConsumerWidget {
//   const AuthScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     final screenSize = MediaQuery.of(context).size;
//     const width = 0.00069444444444444444444444444444444;
//     const height = 0.0009765625;
//
//     return Scaffold(
//       appBar: AppBar(),
//       body:  Center(
//         child: ConstrainedBox(
//           constraints: BoxConstraints.expand(width: screenSize.width * width * 443 , height: screenSize.height * height * 627),
//           child: Container(color: const Color(0xFFFFFFFF),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset("assets/images/logo.png",width: screenSize.width * width * 44 , height: screenSize.height * height * 44,),
//                 const Text('Login Page'),
//                 ElevatedButton(
//                   onPressed: () => ref.read(loginControllerProvider.notifier).login(
//                     'myEmail',
//                     'myPassword',
//                   ),
//                   child: const Text('Login'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:srm_test/controllers/app/switch_body.dart';
import 'package:academus_2/features/auth/ui/widgets/auth_errmsg.dart';
import 'package:academus_2/features/auth/ui/widgets/auth_input_decoration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:srm_test/screens/login/login_input_decoration.dart';
//import http package manually

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AuthScreen();
  }
}

class _AuthScreen extends ConsumerState<AuthScreen> {
  late String errormsg;
  late bool error, showprogress;
  late String username, password;

  final _username = TextEditingController();
  final _password = TextEditingController();

  startAuth() async {
    final routerProvider = ref.watch(serviceLocator.routerProvider);
    routerProvider.goNamed(AppRoutes.tasks.name);
  }

  @override
  void initState() {
    username = "";
    password = "";
    errormsg = "";
    error = false;
    showprogress = false;

    //_username.text = "defaulttext";
    //_password.text = "defaultpassword";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Theme.of(context).colorScheme.background,
          padding: constraints.maxWidth < 500
              ? EdgeInsets.zero
              : const EdgeInsets.all(30.0),
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        child: Text(
                          AppLocalizations.of(context).loginScreenMainTitle,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: Const.fontSizeBodyTitle,
                              fontWeight: FontWeight.bold),
                        ), //title text
                      ),
                      Text(
                        AppLocalizations.of(context).loginScreenSubTitle,
                        style: TextStyle(color: Colors.grey[900], fontSize: 15),
                      ),
                      Container(
                        //show error message here
                        margin: const EdgeInsets.only(top: 150),
                        padding: const EdgeInsets.all(10),
                        child: error ? ErrMsg(text: errormsg) : Container(),
                        //if error == true then show error message
                        //else set empty container as child
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsets.only(top: 50),
                          child: FormTextField(
                            controller: _username,

                            label: AppLocalizations.of(context)
                                .loginScreenLoginPlaceholder,

                            prefixIcon: Icons.person,

                            // validator: (value) => Validators.loginValidator(value, locale),
                          )
                          // TextField(
                          //   controller: _username, //set username controller
                          //   style:
                          //       TextStyle(color: Colors.grey[800], fontSize: 20),
                          //   decoration: InputDecorationAuth.myInputDecoration(
                          //     label: AppLocalizations.of(context)
                          //         .loginScreenLoginPlaceholder,
                          //     icon: Icons.person,
                          //   ),
                          //   onChanged: (value) {
                          //     //set username  text on change
                          //     username = value;
                          //   },
                          // ),
                          ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: _password,
                          //set password controller
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 20),
                          obscureText: true,
                          decoration: InputDecorationAuth.myInputDecoration(
                            label: AppLocalizations.of(context)
                                .loginScreenPasswordPlaceholder,
                            icon: Icons.lock,
                          ),
                          onChanged: (value) {
                            // change password text
                            password = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: FormButton(
                          btnText:
                              AppLocalizations.of(context).loginScreenEnterBtn,
                          onPressed: () {
                            setState(() {
                              //show progress indicator on click
                              showprogress = true;
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                startAuth();
                              });
                            });
                          },
                        ),
                      )
                    ]),
              ),
            ),
          ));
    }));
  }
}
