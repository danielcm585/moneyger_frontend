import 'package:moneyger_frontend/models/wallet.dart';
import 'package:moneyger_frontend/models/activity.dart';

class User {
  String? _id;
  String? username;
  String? email;
  String? photo;
  int? balance;
  List<Wallet>? wallet;
  List<Activity>? history;

  User(this._id, this.username, this.email, this.photo, this.balance, this.wallet, this.history);

  User.fromJson(Map<dynamic, dynamic> json) {
    _id = json["_id"];
    username = json["username"];
    email = json["email"];
    photo = json["photo"];
    balance = json["balance"];
    if (json["wallet"] != null) {
      wallet = [];
      json["wallet"].forEach((wallet) {
        wallet!.add(Wallet.fromJson(wallet));
      });
    }
    if (json["history"] != null) {
      history = [];
      json["history"].forEach((history) {
        history!.add(Wallet.fromJson(history));
      });
    }
  }
}