import './wallet.dart';
import './activity.dart';

class User {
  final String username;
  final String email;
  final double balance;
  final List<Wallet> wallet;
  final List<Activity> history;

  User(this.username, this.email, this.balance, this.wallet, this.history);
}