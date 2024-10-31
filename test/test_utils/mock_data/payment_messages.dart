class PaymentMessages {
  static const List<String> sampleMessages = [
    'ICICI Bank Acct XX895 debited for Rs 4000.00 on 31-Oct-24; AKSHAY FIREWORK credited. UPI: 467104069123. Call 18002662 for dispute. SMS BLOCK 895 to 9215676766',
    'Rs.457 spent on HDFC Bank Card x0952 at _ABCOFFEE. on 2024-10-31:15:24:50.Not U? To Block & Reissue Call 18002586161/SMS BLOCK CC 0952 to 7308080808',
    'HDFC Bank Card x0952: Rs.1,299.00 spent at AMAZON RETAIL on 2024-10-31:14:15:20. Avl bal: Rs.48,701.00',
    'Rs.2500 debited from A/c XX123 to UPI/SWIGGY/45612378901 on 31-Oct-24. Balance: Rs.25,400.50. Call 18001234567 for queries.',
    'ICICI Bank Card XX789: INR 3,500.00 spent at BOOKMYSHOW on 31-Oct-24 15:30:25. Avl Limit: 96,500.00',
    'Payment of Rs.899 made via UPI to NETFLIX INDIA (UPI ID: netflix@hdfcbank) on 31-Oct-24.',
    'Rs.750 debited from your A/c XX456 for PVR CINEMAS on 31-Oct-24 via UPI ID pvr@axisbank.',
    'HDFC Bank: Rs.5,999 spent on Card ending 4567 at FLIPKART on 31-Oct-24. Not you? Call 18002586161',
    'Transaction alert: Rs.2,100 paid to UBER INDIA via UPI (Ref: UPI/456789123) on 31-Oct-24 20:15:30',
    'ICICI Bank: INR 1,850.00 debited at BIG BASKET via Card ending 3421 on 31-Oct-24. Avl bal: 35,400.25',
  ];

  static const Map<String, dynamic> expectedResults = {
    'transactions': [
      {
        'date': '2024-10-31',
        'amount': 4000.00,
        'category': 'entertainment',
        'paymentMode': 'UPI',
        'merchantName': 'AKSHAY FIREWORK'
      },
      {
        'date': '2024-10-31',
        'amount': 457.00,
        'category': 'food_and_beverages',
        'paymentMode': 'CREDIT_CARD',
        'merchantName': 'ABCOFFEE'
      },
      {
        'date': '2024-10-31',
        'amount': 1299.00,
        'category': 'shopping',
        'paymentMode': 'CREDIT_CARD',
        'merchantName': 'AMAZON RETAIL'
      },
      {
        'date': '2024-10-31',
        'amount': 2500.00,
        'category': 'food_and_beverages',
        'paymentMode': 'UPI',
        'merchantName': 'SWIGGY'
      },
      {
        'date': '2024-10-31',
        'amount': 3500.00,
        'category': 'entertainment',
        'paymentMode': 'CREDIT_CARD',
        'merchantName': 'BOOKMYSHOW'
      },
      {
        'date': '2024-10-31',
        'amount': 899.00,
        'category': 'entertainment',
        'paymentMode': 'UPI',
        'merchantName': 'NETFLIX INDIA'
      },
      {
        'date': '2024-10-31',
        'amount': 750.00,
        'category': 'entertainment',
        'paymentMode': 'UPI',
        'merchantName': 'PVR CINEMAS'
      },
      {
        'date': '2024-10-31',
        'amount': 5999.00,
        'category': 'shopping',
        'paymentMode': 'CREDIT_CARD',
        'merchantName': 'FLIPKART'
      },
      {
        'date': '2024-10-31',
        'amount': 2100.00,
        'category': 'travel',
        'paymentMode': 'UPI',
        'merchantName': 'UBER INDIA'
      },
      {
        'date': '2024-10-31',
        'amount': 1850.00,
        'category': 'shopping',
        'paymentMode': 'CREDIT_CARD',
        'merchantName': 'BIG BASKET'
      }
    ]
  };
} 