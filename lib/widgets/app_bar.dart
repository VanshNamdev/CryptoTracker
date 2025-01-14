import 'package:cryptotracker/route/routes.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Text(
              "CryptoTracker",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              ".",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 58, 128, 233),
                  ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer(); // Open the right drawer
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}

// Drawer widget can be part of the same file for convenience
class CustomDrawer extends StatelessWidget {
  final String currentPage; // Track the current active page

  const CustomDrawer({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3, // 30% of the screen width
      child: Drawer(
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          0.0,
        ),
        surfaceTintColor: Theme.of(context).appBarTheme.backgroundColor,
        child: ListView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          children: <Widget>[
            ListTile(
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: currentPage == 'Home' ? FontWeight.w500 : FontWeight.normal, // Bold if active
                    ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.home);;
                // Navigate to Home page
              },
            ),
            ListTile(
              title: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: currentPage == 'Dashboard' ? FontWeight.w500 : FontWeight.normal, // Bold if active
                    ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
                // Navigate to Dashboard page
              },
            ),
            ListTile(
              title: Text(
                'Compare',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: currentPage == 'Compare' ? FontWeight.bold : FontWeight.normal, // Bold if active
                    ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.compare);
                // Navigate to Compare page
              },
            ),
          ],
        ),
      ),
    );
  }
}
