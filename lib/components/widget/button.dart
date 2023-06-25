import 'package:flutter/material.dart';
import 'package:birthdayapp/components/theme.dart';

class MyButton extends StatelessWidget {
  final bool icon;
  final String label;
  final Function()? onTap;
  const MyButton(
      {super.key,
      required this.label,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: primaryColor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon
                    ? const Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    : Container(),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ));
  }
}
