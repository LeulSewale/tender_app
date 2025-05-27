import 'package:flutter/material.dart';
import 'info_column.dart';

class InfoRow extends StatelessWidget {
  final List<InfoColumn> columns;

  const InfoRow({Key? key, required this.columns}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          columns
              .map(
                (column) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: column,
                  ),
                ),
              )
              .toList(),
    );
  }
}
