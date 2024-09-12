import 'package:flutter/material.dart';

void main() {
  runApp(const BiddingApp());
}

class BiddingApp extends StatelessWidget {
  const BiddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidding Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Removed debug banner
      home: const BidPage(title: 'Bidding Application'),
    );
  }
}

class BidPage extends StatefulWidget {
  const BidPage({super.key, required this.title});

  final String title;

  @override
  State<BidPage> createState() => _BidPageState();
}

class _BidPageState extends State<BidPage> {
  int _currentBid = 100;

  void _increaseBid() {
    setState(() {
      _currentBid += 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your highest bid so far:',
              style: TextStyle(fontSize: 20, backgroundColor: Colors.lightGreenAccent),
            ),
            Text(
              '\$$_currentBid',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseBid,
        tooltip: 'Raise Bid',
        child: const Icon(Icons.add),
      ),
    );
  }
}
