import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sns/constants/routes.dart' as routes;
import 'package:sns/constants/strings.dart';
// import 'package:sns/details/rounded_button.dart';
import 'package:sns/details/sns_bottom_navigation_bar.dart';
import 'package:sns/models/bottom_navigation_bar_model.dart';
import 'package:sns/models/main_model.dart';
import 'package:sns/views/login_page.dart';
import 'package:sns/views/main/home_screen.dart';
import 'package:sns/views/main/profile_screen.dart';
import 'package:sns/views/main/search_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final User? onceUser = FirebaseAuth.instance.currentUser;
    // final MainModel mainModel = ref.watch(mainProvider);
    return MaterialApp(
      title: mainTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onceUser == null
          ? LoginPage()
          : MyHomePage(
              title: mainTitle,
            ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final BottomNavigationBarModel navigationBarModel =
        ref.watch(BottomNavigationBarProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainModel.isLoading
          ? Center(
              child: Text(loadingText),
            )
          : PageView(
              controller: navigationBarModel.pageController,
              onPageChanged: (index) =>
                  navigationBarModel.onPageChanged(index: index),
              children: [
                HomeScreen(),
                SearchScreen(),
                ProfileScreen(
                  mainModel: mainModel,
                ),
              ],
            ),
      // : Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      // RoundedButton(
      //     text: mainSignupButtonText,
      //     onPressed: () => routes.toSignupPage(context: context),
      //     widthRate: 0.5,
      //     backgroundColor: Colors.blue),
      // RoundedButton(
      //     text: mainLoginButtonText,
      //     onPressed: () => routes.toLoginPage(context: context),
      //     widthRate: 0.5,
      //     backgroundColor: Colors.blue),
      // RoundedButton(
      //     text: logoutButtonText,
      //     onPressed: () async => mainModel.logout(
      //         context: context, mainModel: mainModel),
      //     widthRate: 0.85,
      //     backgroundColor: Colors.red),
      // Center(
      //   child: Text("私の名前は${mainModel.currentUserDoc['userName']}です"),
      // )
      // ],
      bottomNavigationBar: SNSBottomNavigationBar(model: navigationBarModel),
    );
  }
}
