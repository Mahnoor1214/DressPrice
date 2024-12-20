import 'package:flutter/material.dart';
class Dress extends StatefulWidget {
  const Dress({Key? key}) : super(key: key);

  @override
  State<Dress> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Dress> {
  int dressPrice = 3000;
  int numberOfDresses = 8;
  double taxRate = 0.17;
  double? totalPrice;
  double? totalTax;
  double? finalPrice;
  void calculatePrice() {
    totalPrice = (dressPrice * numberOfDresses) as double?;

    if (totalPrice! > 5000) {
      totalTax = totalPrice! * taxRate;
      finalPrice = totalPrice! + totalTax!;
    } else {
      totalTax = 0;
      finalPrice = totalPrice;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dress Price Calculator'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dress Price Calculator'),
                const SizedBox(height: 20),
                Container(

                  height: 30,
                  width: double.infinity,

                  child:Center(child:Text('Dress Price: $dressPrice'), ),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 30,
                  width: double.infinity,
                  child:Center(child:Text('Number of Dresses: $numberOfDresses'), ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculatePrice,
                  child: const Text('Calculate Price'),
                ),
                const SizedBox(height: 20),
                totalPrice != null
                    ? Column(
                  children: [
                    Text('Total Price: $totalPrice'),
                    Text('Tax Rate: $taxRate%'),
                    Text('Total Tax: $totalTax'),
                    Text('Final Price: $finalPrice'),
                  ],
                )
                    : const Text(''),
              ],
            ),
        ),
        );
    }
}
