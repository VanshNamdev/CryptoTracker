import 'package:cryptotracker/model/apiFetch.dart';
import 'package:cryptotracker/model/crypto.dart';
import 'package:cryptotracker/widgets/app_bar.dart';
import 'package:flutter/material.dart';
 // The file containing `fetchCryptoData`

class CompareScreen extends StatefulWidget {
  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  Crypto? selectedCurrency1;
  Crypto? selectedCurrency2;
  List<Crypto> cryptoList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCryptos();
  }

  Future<void> loadCryptos() async {
    try {
      final data = await fetchCryptoData();
      setState(() {
        cryptoList = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error loading crypto data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWidget(),
      endDrawer: const CustomDrawer(currentPage: "Compare"),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Dropdowns for currency selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<Crypto>(
                          value: selectedCurrency1,
                          hint: Text('Select Currency 1'),
                          items: cryptoList
                              .map((crypto) => DropdownMenuItem(
                                    value: crypto,
                                    child: Text(crypto.name),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCurrency1 = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<Crypto>(
                          value: selectedCurrency2,
                          hint: Text('Select Currency 2'),
                          items: cryptoList
                              .map((crypto) => DropdownMenuItem(
                                    value: crypto,
                                    child: Text(crypto.name),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCurrency2 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Side-by-side comparison
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: selectedCurrency1 != null
                              ? CryptoDescriptionCard(crypto: selectedCurrency1!)
                              : PlaceholderWidget('Currency 1'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: selectedCurrency2 != null
                              ? CryptoDescriptionCard(crypto: selectedCurrency2!)
                              : PlaceholderWidget('Currency 2'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// Reusable widget for displaying cryptocurrency description
class CryptoDescriptionCard extends StatelessWidget {
  final Crypto crypto;

  const CryptoDescriptionCard({required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              crypto.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Symbol: ${crypto.symbol.toUpperCase()}'),
            SizedBox(height: 5),
            Text('Current Price: \$${crypto.currentPrice.toStringAsFixed(2)}'),
            SizedBox(height: 5),
            Text('Market Cap: \$${crypto.marketCap.toStringAsFixed(2)}'),
            SizedBox(height: 5),
            Text('24h Change: ${crypto.priceChangePercentage24h.toStringAsFixed(2)}%'),
          ],
        ),
      ),
    );
  }
}

// Placeholder widget for when no currency is selected
class PlaceholderWidget extends StatelessWidget {
  final String label;

  const PlaceholderWidget(this.label);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Select $label',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
