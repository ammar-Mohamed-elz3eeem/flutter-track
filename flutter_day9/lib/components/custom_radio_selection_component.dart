import 'package:flutter/material.dart';
import 'package:flutter_day9/models/player_model.dart';

class CustomRadioSelection extends StatefulWidget {
  final Function(int) valueChanged;
  final int numberOfChoices;
  final List<Player> players;

  const CustomRadioSelection(
      {super.key,
      required this.players,
      required this.valueChanged,
      required this.numberOfChoices});

  @override
  State<CustomRadioSelection> createState() => _CustomRadioSelectionState();
}

class _CustomRadioSelectionState extends State<CustomRadioSelection> {
  int _value = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.numberOfChoices,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return customRadioSelection(index);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 10,
        );
      },
    );
  }

  Widget customRadioSelection(int index) {
    return ListTile(
      onTap: () {
        setState(() {
          _value = index;
          widget.valueChanged(_value);
        });
      },
      title: Center(
        child: Text(
          widget.players[index].name,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      tileColor: Color.fromRGBO(70, 70, 70, 0.66),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
    );
  }
}
