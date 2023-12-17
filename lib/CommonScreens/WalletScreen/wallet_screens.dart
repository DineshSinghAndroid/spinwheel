import 'package:flutter/material.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';

 

 
class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double currentBalance = 1000.0; // Replace with actual balance value
  double withdrawableBalance = 800.0; // Replace with actual withdrawable balance value
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Wallet"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Balance: \$${currentBalance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Withdrawable Balance: \$${withdrawableBalance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the add money screen
                // You can implement the navigation logic here
              },
              child: Text('Add Money'),
            ),
            SizedBox(height: 16),
            ExpansionTile(
              title: Text('Withdraw Money'),
              children: [
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    hintText: 'Enter the amount to withdraw',
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter UPI ID',
                    hintText: 'Enter your UPI ID',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement withdrawal logic here
                    double withdrawalAmount =
                        double.tryParse(amountController.text) ?? 0.0;
                    // Perform withdrawal and update balances
                    setState(() {
                      withdrawableBalance -= withdrawalAmount;
                      currentBalance -= withdrawalAmount;
                    });
                  },
                  child: Text('Withdraw'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
