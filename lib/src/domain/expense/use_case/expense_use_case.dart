import '../../../core/enum/filter_days.dart';
import '../../../core/enum/transaction.dart';
import '../../../data/expense/model/expense.dart';
import '../repository/expense_repository.dart';

class ExpenseUseCase {
  ExpenseUseCase({required this.expenseRepository});

  final ExpenseRepository expenseRepository;

  Future<String> yesterdayTotal() {
    return expenseRepository.filterExpensesTotal(FilterDays.yesterday);
  }

  Future<String> lastSevenDaysExpenseTotal() {
    return expenseRepository.filterExpensesTotal(FilterDays.seven);
  }

  Future<String> lastThirtyDaysExpenseTotal() {
    return expenseRepository.filterExpensesTotal(FilterDays.thirty);
  }

  Future<Map<String, List<Expense>>> expenses(bool isRefresh) {
    return expenseRepository.expenses(isRefresh);
  }

  Future<void> addExpense(
    String name,
    double amount,
    DateTime time,
    int category,
    int account,
    TransactionType type,
  ) async {
    await expenseRepository.addExpense(
      name,
      amount,
      time,
      category,
      account,
      type,
    );
  }

  Future<void> clearExpenses() async {
    expenseRepository.clearExpenses();
  }

  Future<void> clearExpense(int expense) async {
    expenseRepository.clearExpense(expense);
  }

  Future<void> updateExpense(Expense expense) async {
    expenseRepository.updateExpense(expense);
  }

  Future<Expense?> fetchExpenseFromId(int expenseId) async =>
      expenseRepository.fetchExpenseFromId(expenseId);
}
