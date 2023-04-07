import '../concepts/level.dart';
import '../concepts/loan.dart';
import 'assets.dart';

List<Level> levels = [
  // Level 1 - initial level with no cash requirement
  Level(
    startingCash: 10,
    cashGoal: 30,
    assets: [chickens.copyWith(riskLevel: 0)],
    loan: Loan(interestRate: 0.20, asset: cow),
    loanInterestRandomized: true,
    savingsRate: 0.0,
  ),
  // Level 2
  Level(
    cashGoal: 30,
    assets: [chickens],
    loan: Loan(interestRate: 0.30, asset: cow),
  ),
  // Level 3
  Level(
    cashGoal: 50,
    assets: [cow],
    assetsAreRandomized: true,
    loan: Loan(interestRate: 0.40, asset: cow),
  ),
  // Level 4
  Level(
    cashGoal: 70,
    assets: [cow, chickens, goats],
    loan: Loan(interestRate: 0.25, asset: cow),
  ),
  // Level 5
  Level(
    cashGoal: 100,
    assets: [cow, chickens, goats],
    assetsAreRandomized: true,
    loan: Loan(interestRate: 0.30, asset: cow),
  ),
];
