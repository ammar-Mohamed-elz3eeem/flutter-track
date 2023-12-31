import 'package:flutter_day9/models/data_model.dart';

class Clothes extends Data {
  Clothes(String? name, List<String>? related) : super(name, related);

  static List<Clothes> instances = [
    Clothes("قميص", ["بليزر", "جاكيت", "معطف", "صديري"]),
    Clothes("تي شيرت", ["سويت شيرت", "هاي كول", "بادي"]),
    Clothes("بنطلون", ["كلسون", "سروال", "شورت"]),
    Clothes("جلابية", ["عباية", "عمة", "بشت"]),
    Clothes("بليزر", ["قميص", "جاكيت", "معطف"]),
    Clothes("جاكيت", ["قميص", "بليزر", "معطف"]),
    Clothes("معطف", ["قميص", "بليزر", "جاكيت"]),
    Clothes("بادي", ["سويت شيرت", "هاي كول", "تي شيرت"]),
    Clothes("سويت شيرت", ["تي شيرت", "هاي كول", "بادي"]),
    Clothes("هاي كول", ["سويت شيرت", "تي شيرت", "بادي"]),
    Clothes("كلسون", ["بنطلون", "سروال", "شورت"]),
    Clothes("سروال", ["كلسون", "بنطلون", "شورت"]),
    Clothes("شورت", ["كلسون", "سروال", "بنطلون"]),
    Clothes("عباية", ["جلابية", "عمة", "بشت"]),
    Clothes("عمة", ["عباية", "جلابية", "بشت"]),
    Clothes("بشت", ["عباية", "عمة", "جلابية"]),
  ];
}
