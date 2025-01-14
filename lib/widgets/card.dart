import 'package:cryptotracker/model/crypto.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/views/description_view.dart'; // Import the new screen

class CustomCard extends StatelessWidget {
  final Crypto crypto;

  const CustomCard({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrencyDescription(crypto: crypto),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(crypto.image),
              radius: 30,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              crypto.name.length > 20
                  ? '${crypto.name.substring(0, 20)}...'
                  : crypto.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Price: \$${crypto.currentPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Change (24h): ${crypto.priceChangePercentage24h.toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 16,
                color: crypto.priceChangePercentage24h >= 0
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
