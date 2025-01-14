import 'package:cryptotracker/model/crypto.dart';
import 'package:cryptotracker/widgets/card.dart';
import 'package:flutter/material.dart';

class CryptoGridView extends StatelessWidget {
  final List<Crypto> cryptoList;

  const CryptoGridView(this.cryptoList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: cryptoList.length, // Set the number of grid items
      itemBuilder: (context, index) {
        return CustomCard(crypto: cryptoList[index]); // Pass the Crypto object to each CustomCard
      },
    );
  }
}
