
import '../classes.dart';
import 'diamond_plan_class.dart';
import 'gold_plan_class.dart';
import 'silver_plan_class.dart';

class FreeUser {
  String? username;
  String? password;
  String? lastname;
  String? email;
  double total_amount = 0;
  int? id;
  static int counter = 0;

  static double total_income = 0;

  FreeUser(uname, pass, lname, email) {
    this.username = uname;
    this.password = pass;
    this.lastname = lname;
    this.email = email;
    counter++;
    this.id = counter;
  }


  static double incomeAfterTaxes(double taxes) {
    total_income -= taxes;
    return total_income;
  }

  void buyProduct(double product_price) {
    this.total_amount += product_price;
    total_income += product_price;
  }

  // Magic Methods
  Map<Object, Plan> call() {
    return {
      "Gold": new GoldPlan(),
      "Silver": new SilverPlan(),
      "Diamond": new DiamondPlan()
    };
  }  
}
