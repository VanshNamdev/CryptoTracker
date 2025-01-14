import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cryptotracker/route/routes.dart';
import 'package:cryptotracker/widgets/app_bar.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Override the back button behavior
  Future<bool> _onWillPop() async {
    // If the navigation stack is empty, exit the app
    if (Navigator.of(context).canPop()) {
      return true; // Pop the screen
    } else {
      if (Platform.isAndroid) {
        exit(0); // Exit the app on Android
      } else if (Platform.isIOS) {
        // Optionally add iOS exit logic if necessary
        return false; // iOS does not have a direct exit method
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBarWidget(),
        endDrawer: const CustomDrawer(
          currentPage: "Home",
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                "Track",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 70,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Crypto",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 70,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Real Time.",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color.fromARGB(255, 58, 128, 233),
                      fontSize: 70,
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                "Track crypto prices in real time.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.dashboard);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 58, 128, 233),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      ),
                      child: Text(
                        "DashBoard",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 58, 128, 233),
                            width: 2.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      ),
                      child: Text(
                        "Share",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Lottie.asset(
                  'assets/animations/graph.json'),
            ],
          ),
        ),
      ),
    );
  }
}
