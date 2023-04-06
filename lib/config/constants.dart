const String appTitle = 'FinSim Game';
// defines if interest and savings rates are random
const bool levelInterestAndSavingsRandomized = true;

// decimal points for borrow and interest rates
// on "investment options" screen
const int decimalValuesToDisplay = 0;

// initial values when new level starts
const double initialMoney = 5;
const double initialPersonalIncome = 8;
const double initialPersonalExpenses = 7;

// default values
const int defaultLifeSpan = 6;
const int defaultLoanTerm = 2;
const double defaultCashInterest = 0.05; // used when not randomized

// limits for random values
const double minimumSavingsRate = 0.0;
const double maximumSavingsRate = 0.10;
const double stepsSavingsRate = 0.05;

const double minimumInterestRate = 0.15;
const double maximumInterestRate = 0.30;
const double stepsInterestRate = 0.05;

const double minimumRiskLevel = 0.20;
const double maximumRiskLevel = 0.40;
const double stepsRiskLevel = 0.05;