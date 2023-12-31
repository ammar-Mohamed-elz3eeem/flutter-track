import 'package:flutter_day9/models/data_model.dart';

class Countries extends Data {
  Countries(String? name, List<String>? related) : super(name, related);

  static List<Countries> instances = [
    Countries("فلسطين", ["تونس", "الجزائر", "المغرب"]),
    Countries("عمان", ["الكويت", "اليمن", "العراق"]),
    Countries("غانا", ["نيجيريا", "تنزانيا", "ساحل العاج"]),
    Countries("تايلاند", ["الفلبين", "كوريا الجنوبية", "الهند"]),
    Countries("تشيلي", ["البرازيل", "المكسيك", "كوبا"]),
    Countries("تونس", ["فلسطين", "الجزائر", "المغرب"]),
    Countries("الجزائر", ["تونس", "فلسطين", "المغرب"]),
    Countries("المغرب", ["تونس", "الجزائر", "فلسطين"]),
    Countries("الكويت", ["عمان", "اليمن", "العراق"]),
    Countries("اليمن", ["الكويت", "عمان", "العراق"]),
    Countries("العراق", ["الكويت", "اليمن", "عمان"]),
    Countries("نيجيريا", ["غانا", "تنزانيا", "ساحل العاج"]),
    Countries("تنزانيا", ["نيجيريا", "غانا", "ساحل العاج"]),
    Countries("ساحل العاج", ["نيجيريا", "تنزانيا", "غانا"]),
    Countries("الفلبين", ["تايلاند", "كوريا الجنوبية", "الهند"]),
    Countries("كوريا الجنوبية", ["الفلبين", "تايلاند", "الهند"]),
    Countries("الهند", ["الفلبين", "كوريا الجنوبية", "تايلاند"]),
    Countries("البرازيل", ["تشيلي", "المكسيك", "كوبا"]),
    Countries("المكسيك", ["البرازيل", "تشيلي", "كوبا"]),
    Countries("كوبا", ["البرازيل", "المكسيك", "تشيلي"]),
  ];
}
