import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cryptotracker/model/crypto.dart';

class CurrencyDescription extends StatelessWidget {
  final Crypto crypto;

  const CurrencyDescription({super.key, required this.crypto});

  String formatNumber(double number) {
    final NumberFormat formatter = NumberFormat.compact();
    return formatter.format(number);
  }

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat.yMMMMd().format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.name),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with image and name
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(crypto.image),
                    radius: 50,
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    crypto.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    crypto.symbol.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Graph Section
            Text(
              'Price Trend (24h)',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.blueAccent),
            ),
            const Divider(),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: [
                        FlSpot(0, crypto.low24h),
                        FlSpot(1, crypto.high24h),
                        FlSpot(2, crypto.currentPrice),
                      ],
                      color: Colors.blueAccent,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blueAccent.withOpacity(0.3),
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Low 24h');
                            case 1:
                              return const Text('High 24h');
                            case 2:
                              return const Text('Current');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Price Section
            Text(
              'Price Details',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.blueAccent),
            ),
            const Divider(),
            ListTile(
              title: const Text('Current Price:'),
              trailing: Text(
                '\$${crypto.currentPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
            ),
            ListTile(
              title: const Text('24h High:'),
              trailing: Text('\$${crypto.high24h.toStringAsFixed(2)}'),
            ),
            ListTile(
              title: const Text('24h Low:'),
              trailing: Text('\$${crypto.low24h.toStringAsFixed(2)}'),
            ),
            const SizedBox(height: 20),

            // Other details (Market, Supply, etc.)
            Text(
              'Market Data',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.blueAccent),
            ),
            const Divider(),
            ListTile(
              title: const Text('Market Cap:'),
              trailing: Text('\$${formatNumber(crypto.marketCap)}'),
            ),
            ListTile(
              title: const Text('Market Cap Rank:'),
              trailing: Text('#${crypto.marketCapRank}'),
            ),
            ListTile(
              title: const Text('24h Volume:'),
              trailing: Text('\$${formatNumber(crypto.totalVolume)}'),
            ),
          ],
        ),
      ),
    );
  }
}
