/// List of keywords that indicate a financial transaction in various currencies
const List<String> currencyKeywords = [
  // Indian Rupee
  'rs',
  'inr',
  'rupee',
  'rupees',
  // US Dollar
  'usd',
  'dollar',
  'dollars',
  // Euro
  'eur',
  'euro',
  'euros',
  // British Pound
  'gbp',
  'pound',
  'pounds',
  // Generic
  'spent',
  'debited',
  'credited',
  'paid',
  'payment',
  'transaction',
];

/// Currency symbols to detect in messages
const List<String> currencySymbols = [
  '₹', // Indian Rupee
  '\$', // US Dollar
  '€', // Euro
  '£', // British Pound
];

/// Combined list of all financial keywords including symbols
const List<String> allFinancialKeywords = [
  ...currencyKeywords,
  ...currencySymbols,
]; 