const Map<String, dynamic> structuredResponseSchema = {
  'type': 'object',
  'properties': {
    'transactions': {
      'type': 'array',
      'items': {
        'type': 'object',
        'properties': {
          'amount': {
            'type': 'number',
            'description': 'Transaction amount in INR',
          },
          'category': {
            'type': 'string',
            'enum': [
              'food_and_beverages',
              'shopping',
              'entertainment',
              'travel',
              'utilities',
              'others'
            ],
            'description': 'Category based on merchant name',
          },
          'paymentMode': {
            'type': 'string',
            'enum': ['UPI', 'CREDIT_CARD', 'DEBIT_CARD'],
            'description': 'Mode of payment used',
          },
          'merchantName': {
            'type': 'string',
            'description': 'Name of the merchant',
          },
        },
        'required': [
          'amount',
          'category',
          'paymentMode',
          'merchantName'
        ],
      },
    },
  },
  'required': ['transactions'],
}; 