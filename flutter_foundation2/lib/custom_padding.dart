import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  const CustomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 256),
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(fit: BoxFit.contain, 'assets/jorge.jpg'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('secondPage');
              },
              style: ButtonStyle(
                // minimumSize: WidgetStatePropertyAll(Size(50, 50)),
                // fixedSize: WidgetStatePropertyAll(Size(300, 50)),
              ),
              child: Text(
                'Butão',
                style: TextStyle(color: Colors.pink, fontSize: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
