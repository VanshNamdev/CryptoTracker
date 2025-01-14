import 'package:cryptotracker/model/apiFetch.dart';
import 'package:cryptotracker/model/crypto.dart';
import 'package:cryptotracker/widgets/app_bar.dart';
import 'package:cryptotracker/widgets/gridBuilder.dart';
import 'package:cryptotracker/widgets/listBuilder.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String selectedView = 'Grid'; // Default to 'Grid'
  double underlinePosition = 0.0; // Position of the underline
  late Future<List<Crypto>> futureCryptoData;
  List<Crypto> allCryptoData = []; // Store the entire list of cryptocurrencies
  List<Crypto> filteredCryptoData = []; // Filtered list based on search
  TextEditingController searchController = TextEditingController(); // Search controller

  @override
  void initState() {
    super.initState();
    underlinePosition = selectedView == 'Grid' ? 0.0 : 200.0; // Adjust underline
    fetchCryptoDataAndInitialize(); // Fetch the crypto data and initialize
  }

  // Fetch data from the API and initialize both allCryptoData and filteredCryptoData
  Future<void> fetchCryptoDataAndInitialize() async {
    try {
      List<Crypto> cryptoData = await fetchCryptoData();
      setState(() {
        allCryptoData = cryptoData; // Initialize full data
        filteredCryptoData = cryptoData; // Initially, filtered data is the same
      });
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  // Function to filter crypto data based on the search query
  void _filterCryptoData(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCryptoData = allCryptoData; // Show full list if search query is empty
      });
    } else {
      List<Crypto> filtered = allCryptoData
          .where((crypto) =>
              crypto.name.toLowerCase().contains(query.toLowerCase())) // Match search query
          .toList();

      setState(() {
        filteredCryptoData = filtered; // Update filtered list
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose(); // Dispose of the search controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      endDrawer: const CustomDrawer(currentPage: "Dashboard"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          // Search Field
          Container(
            height: 50,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: TextField(
                controller: searchController, // Link the controller
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).inputDecorationTheme.prefixIconColor,
                  ),
                ),
                onChanged: (value) {
                  _filterCryptoData(value); // Call the filter function on input change
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedView = 'Grid';
                        underlinePosition = 0.0; // Update underline position for Grid
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Grid",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: selectedView == 'Grid'
                                  ? const Color.fromARGB(255, 58, 128, 233)
                                  : Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedView = 'List';
                        underlinePosition = 200.0; // Update underline position for List
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "List",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: selectedView == 'List'
                                  ? const Color.fromARGB(255, 58, 128, 233)
                                  : Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                bottom: 0,
                left: underlinePosition,
                child: Container(
                  height: 2,
                  width: 200, // Underline width, adjust if needed
                  color: Colors.blue, // Underline color
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: selectedView == 'Grid'
                ? CryptoGridView(filteredCryptoData)
                : CryptoListView(filteredCryptoData),
          ),
        ],
      ),
    );
  }
}
