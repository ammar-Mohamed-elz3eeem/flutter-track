import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final int selectedValue;
  final Function(int) valueChanged;

  CustomRadioButton(
      {super.key, required this.valueChanged, required this.selectedValue});

  State<CustomRadioButton> createState() => _CustomRadioButton();
}

class _CustomRadioButton extends State<CustomRadioButton> {
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SizedBox(
          child: customRadioButton(index),
        );
      },
    );
  }

  Widget customRadioButton(int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _value = index;
          widget.valueChanged(_value);
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: const CircleBorder(),
        side: BorderSide(
            color: (_value == index) ? Colors.green : Colors.black54, width: 6),
      ),
      child: Image.asset(
        "assets/avatars/avatar-$index.png",
      ),
    );
  }
}
