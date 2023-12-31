import '../classes.dart';

class PaidUser extends FreeUser {
  Plan plan;

  PaidUser(this.plan, user, pass, lname, email):
  super(user, pass, lname, email);

  @override
  void buyProduct(double product_price) {
    this.total_amount += product_price - (plan.discount_price * product_price);
  }
}
