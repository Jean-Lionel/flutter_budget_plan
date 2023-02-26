import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spedingAmount;
  final double spedingAmountTotal;

  ChartBar(this.label, this.spedingAmount, this.spedingAmountTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, chart) {
        return Column(
          children: [
            Container(
              height: chart.maxHeight * 0.15,
              child: Text('\$${spedingAmount.toStringAsFixed(0)}'),
            ),
            SizedBox(
              height: chart.maxHeight * 0.05,
            ),
            Container(
              height: chart.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromARGB(220, 200, 195, 195),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spedingAmountTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: chart.maxHeight * 0.05,
            ),
            Container(
              height: chart.maxHeight * 0.1,
              child: Flexible(
                fit: FlexFit.tight,
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );

    
  }
}
