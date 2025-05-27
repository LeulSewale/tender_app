import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Icon(Icons.description, color: AppColors.primaryColor),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

class DownloadButton extends StatelessWidget {
  final String label;
  DownloadButton({required this.label});
  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.download, color: AppColors.primaryColor),
    label: Text(label, style: TextStyle(color: Colors.black)),
    style: ElevatedButton.styleFrom(
      side: BorderSide(color: AppColors.primaryColor),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );
}

class InfoRow extends StatelessWidget {
  final String label1, value1, label2, value2;
  InfoRow({
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
  });
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans',
              ),
            ),
            Text(value1, style: TextStyle(fontFamily: 'DMSans')),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans',
              ),
            ),
            Text(value2, style: TextStyle(fontFamily: 'DMSans')),
          ],
        ),
      ],
    ),
  );
}

class StepCircle extends StatelessWidget {
  final int number;
  final bool isActive;
  StepCircle({required this.number, required this.isActive});
  @override
  Widget build(BuildContext context) => CircleAvatar(
    backgroundColor: isActive ? AppColors.primaryColor : Colors.white,
    radius: 20,
    child: Text(
      number.toString(),
      style: TextStyle(
        color: isActive ? Colors.white : AppColors.primaryColor,
        fontFamily: 'DMSans',
      ),
    ),
  );
}
