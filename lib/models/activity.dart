import './user.dart';
import './wallet.dart';

class Activity {
  final double amount;
  final String category;
  final String time;
  final User user;
  final Wallet wallet;

  Activity(this.amount, this.category, this.time, this.user, this.wallet);
}