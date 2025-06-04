import 'package:flutter/material.dart';
import 'package:tender_app/app_route.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(Icons.menu, size: 34, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: AppColors.primaryColor,
                      size: 26,
                    ),
                    title: const Text('Home', style: TextStyle(fontSize: 18)),
                    onTap: () {
                      Navigator.pop(context); // Close drawer
                    },
                  ),
                  // _menuItem(context, Icons.home, '', AppRoutes.home),
                  _menuItem(
                    context,
                    Icons.assignment,
                    'Top Tenders',
                    AppRoutes.topTenders,
                  ),
                  _menuItem(
                    context,
                    Icons.business,
                    'Companies',
                    AppRoutes.companies,
                  ),
                  _menuItem(
                    context,
                    Icons.bookmark,
                    'Saved Bids',
                    AppRoutes.savedBids,
                  ),
                  _menuItem(
                    context,
                    Icons.upload,
                    'My Bids',
                    AppRoutes.submittedBids,
                  ),
                  _menuItem(
                    context,
                    Icons.person,
                    'myProfile',
                    AppRoutes.myProfile,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red, size: 26),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor, size: 28),
      title: Text(title, style: TextStyle(fontFamily: "DMSans", fontSize: 18)),
      onTap: () {
        Navigator.pop(context); // Close drawer first
        Navigator.pushNamed(context, route);
      },
    );
  }
}
