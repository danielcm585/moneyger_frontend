import './activity.dart';
import './user.dart';

class Wallet {
  final String label;
  final double balance;
  final String type;
  final User owner;
  final List<Activity> history;

  Wallet(this.label, this.balance, this.type, this.owner, this.history);
}