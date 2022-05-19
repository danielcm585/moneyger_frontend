import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/models/activity.dart';

class Wallet {
  String? id;
  String? label;
  double? balance;
  String? type;
  String? owner;
  List<Activity>? history;

  Wallet(
    this.id, 
    this.label, 
    this.balance, 
    this.type, 
    this.owner, 
    this.history
  );

  Wallet.fromJson(Map<dynamic, dynamic> json) {
    id = json["_id"];
    label = json["label"];
    balance = json["balance"];
    type = json["type"];
    owner = json["owner"];
    if (json["history"] != null) {
      history = [];
      json["history"].forEach((activity) {
        history!.add(Activity.fromJson(activity));
      });
    }
  }
}