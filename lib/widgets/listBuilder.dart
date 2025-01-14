import 'package:cryptotracker/model/crypto.dart';
import 'package:cryptotracker/views/description_view.dart';
import 'package:cryptotracker/widgets/card.dart';
import 'package:flutter/material.dart';

class CryptoListView extends StatelessWidget {
  final List<Crypto> cryptoList;

  const CryptoListView(this.cryptoList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: cryptoList.length, // Set the number of list items
      itemBuilder: (context, index) {
        final crypto = cryptoList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrencyDescription(crypto: crypto),
          ),
        );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.withOpacity(0.5)
                      : Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(crypto.image),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        crypto.name.length > 20 ? '${crypto.name.substring(0, 20)}...' : crypto.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Price: \$${crypto.currentPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Change (24h): ${crypto.priceChangePercentage24h.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 14,
                          color: crypto.priceChangePercentage24h >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
