import 'package:flutter/material.dart';
import 'package:presentation/theme/constants/source_sans_pro_text.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {this.cardWidth,
      this.cardHeight,
      this.cardText,
      this.cardSubText,
      this.cardTrailingText});

  final double? cardWidth;
  final double? cardHeight;
  final String? cardText;
  final String? cardSubText;
  final String? cardTrailingText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: Icon(Icons.check_circle),
            title: Text(
              cardText!,
              style: kSourceSanProTitle15,
            ),
            trailing: Text(cardTrailingText!),
            subtitle: Text(cardSubText!),
          ),
        ),
      ),
    );
  }
}
