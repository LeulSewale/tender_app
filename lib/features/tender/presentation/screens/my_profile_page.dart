import 'package:flutter/material.dart';
import 'package:tender_app/app_route.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder:
            (context) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " My Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    color: Colors.white,

                    child: Column(
                      children: [
                        ProfileCard(),
                        const SizedBox(height: 16),
                        ProfileOption(
                          icon: Icons.description_outlined,
                          label: "Submitted Bids",
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                '/submitted-bids',
                              ),
                        ),
                        Divider(thickness: 0.5, height: 24),

                        ProfileOption(
                          icon: Icons.sync_alt,
                          label: "Payment History",
                          onTap: () {
                            Navigator.pushNamed(context, '/payment-history');
                          },
                        ),
                        Divider(thickness: 0.5, height: 24),

                        ProfileOption(
                          icon: Icons.notifications_none,
                          label: "Notifications",
                          onTap: () {
                            Navigator.pushNamed(context, '/notifications');
                          },
                        ),
                        Divider(thickness: 0.5, height: 24),

                        ProfileOption(
                          icon: Icons.logout,
                          label: "Logout",
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.login,
                              (Route<dynamic> route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "B",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Benyam Assegdw",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Edit Account",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
