class TransactionHistoryModel {
  final int transactionId;
  final String transactionAmount,
      transactionState,
      transactionMethod,
      transactionType,
      created,
      completed,
      cancelled,
      primaryCurrency,
      convertedTo,
      conversationRate;

  TransactionHistoryModel(
    this.transactionId,
    this.transactionAmount,
    this.transactionState,
    this.transactionMethod,
    this.transactionType,
    this.created,
    this.completed,
    this.cancelled,
    this.primaryCurrency,
    this.convertedTo,
    this.conversationRate,
  );
}
