import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/models/wallet.dart';

class Activity {
  String? _id;
  double? amount;
  String? category;
  String? time;
  String? user;
  String? wallet;

  Activity(this._id, this.amount, this.category, this.time, this.user, this.wallet);

  Activity.fromJson(Map<dynamic, dynamic> json) {
    _id = json["_id"];
    amount = json["amount"];
    category = json["category"];
    time = json["time"];
    user = json["user"];
    wallet = json["wallet"];
  }
}