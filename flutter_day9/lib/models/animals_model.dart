import 'package:flutter_day9/models/data_model.dart';

class Animals extends Data {
  Animals(String? name, List<String>? related) : super(name, related);

  static List<Animals> instances = [
    Animals("ثعبان", ['تمساح', 'حرباء', 'برص']),
    Animals("كلب", ["ضبع", "ثعلب", "ذئب"]),
    Animals("أسد", ["نمر", "فهد", "قطة"]),
    Animals("تمساح", ["ثعبان", 'حرباء', 'برص']),
    Animals("حرباء", ["ثعبان", 'تمساح', 'برص']),
    Animals("برص", ["ثعبان", 'تمساح', 'حرباء']),
    Animals("ضبع", ["كلب", "ثعلب", "ذئب"]),
    Animals("ثعلب", ["كلب", "ضبع", "ذئب"]),
    Animals("ذئب", ["كلب", "ضبع", "ثعلب"]),
    Animals("نمر", ["أسد", "فهد", "قطة"]),
    Animals("فهد", ["أسد", "نمر", "قطة"]),
    Animals("قطة", ["أسد", "نمر", "فهد"]),
  ];
}
