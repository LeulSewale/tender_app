import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';
import 'package:tender_app/features/tender/presentation/widgets/tender_info_row.dart';
import 'package:tender_app/features/tender/presentation/screens/tender_information_page.dart';

class TenderCard extends StatefulWidget {
  const TenderCard({super.key});

  @override
  _TenderCardState createState() => _TenderCardState();
}

class _TenderCardState extends State<TenderCard> {
  bool isBookmarked = false;

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TenderInformationPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 0,
          color: AppColors.secondaryColor,
          margin: EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.gavel, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          '140 HP Laptop',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "DMSans",
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.white,
                      ),
                      onPressed: toggleBookmark,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TenderInfoRow(
                      title1: "Tender Title",
                      value1: "140 HP Laptop",
                      title2: "Reference Number",
                      value2: "AA1729387",
                    ),
                    TenderInfoRow(
                      title1: "Tender Type",
                      value1: "Open",
                      title2: "Category / Sector",
                      value2: "Electronics",
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Tender Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: "DMSans",
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Hailom Trading PLC invites bids for the supply and delivery of 140 brand-new HP laptops...",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontFamily: "DMSans",
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Chip(
                          label: Text(
                            "📄 Document",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "DMSans",
                            ),
                          ),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 16),
                        Chip(
                          label: Text(
                            "📷 CPO",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "DMSans",
                            ),
                          ),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
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
