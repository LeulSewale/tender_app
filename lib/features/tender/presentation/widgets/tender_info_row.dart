import 'package:flutter/material.dart';

class TenderInfoRow extends StatelessWidget {
  final String title1, value1, title2, value2;

  TenderInfoRow({
    required this.title1,
    required this.value1,
    required this.title2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    final textStyleTitle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      fontFamily: "DMSans",
    );
    final textStyleValue = TextStyle(fontSize: 13);

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title1, style: textStyleTitle),
                SizedBox(height: 4),
                Text(value1, style: textStyleValue),
              ],
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title2, style: textStyleTitle),
                SizedBox(height: 4),
                Text(value2, style: textStyleValue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
