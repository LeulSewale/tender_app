import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';

class SubmittedBidsPage extends StatelessWidget {
  const SubmittedBidsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Submitted Bids",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          BidCard(),
          SizedBox(height: 16),
          BidCard(),
        ],
      ),
    );
  }
}

class BidCard extends StatelessWidget {
  const BidCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundColor: AppColors.secondaryColor,
                  child: Icon(Icons.gavel, color: AppColors.primaryColor),
                ),
                SizedBox(width: 12),
                Text(
                  "140 HP Laptop",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tender Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Reference Number",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("140 HP Laptop"), Text("AA1729387")],
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tender Type",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Category / Sector",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Open"), Text("Electronics")],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Tender Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Hailom Trading PLC invites bids for the supply and delivery of 140 brand-new HP laptops. Interested bidders must meet specified technical requirements and provide a timely delivery schedule.",
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      icon: const Icon(
                        Icons.insert_drive_file,
                        size: 18,
                        color: AppColors.secondaryColor,
                      ),
                      label: const Text(
                        "Document",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      icon: const Icon(
                        Icons.account_balance_wallet,
                        size: 18,
                        color: AppColors.secondaryColor,
                      ),
                      label: const Text(
                        "CPO",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24, thickness: 1),
                const Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Accepted",
                    style: TextStyle(color: AppColors.secondaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
