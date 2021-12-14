import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/counter_app/expense_list.dart';
import 'package:flutter_ui/pages/counter_app/expense_model.dart';

class CounterAppMainPage extends StatefulWidget {
  @override
  State<CounterAppMainPage> createState() => _CounterAppMainPageState();
}

class _CounterAppMainPageState extends State<CounterAppMainPage>
    with TickerProviderStateMixin {
  Color _deepPurple = Colors.deepPurple;
  Color _purple = Colors.purple[600]!;
  Color _transparent = Colors.transparent;
  Color _yellow = Colors.yellow[600]!;
  Color _black = Colors.black;
  Color _white = Colors.white;
  Color _grey = Colors.grey;

  late TabController _tabController;
  late Size _size;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _deepPurple,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        backgroundColor: _transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Activity"),
      );

  Column _getBody() => Column(
        children: [
          _getTabBar(),
          _getExpenseList(),
        ],
      );

  TabBar _getTabBar() => TabBar(
    padding: EdgeInsets.symmetric(vertical: 24.0),
          controller: _tabController,
          isScrollable: true,
          labelColor: _black,
          unselectedLabelColor: _yellow,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
          labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
          indicator: BoxDecoration(
              color: _yellow, borderRadius: BorderRadius.circular(32.0)),
          tabs: [
            _setTab("All"),
            _setTab("Shopping"),
            _setTab("Taxi"),
            _setTab("Training"),
            _setTab("Communal"),
          ]);

  Tab _setTab(String title) => Tab(
        height: 32.0,
        text: title,
      );

  Expanded _getExpenseList() => Expanded(
      child: ListView.builder(
          itemCount: expenseList.length,
          itemBuilder: (context, index) {
            Expense expense = expenseList[index];
            return _setExpense(expense);
          }));

  _setExpense(Expense expense) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
        decoration: BoxDecoration(
          color: _purple,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          title: Text(
            expense.name,
            style: TextStyle(color: _yellow, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(expense.date, style: TextStyle(color: _white)),
          trailing: Text(
            "\$${expense.money}",
            style: TextStyle(color: _white, fontWeight: FontWeight.bold),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              expense.imageUrl,
              width: 48.0,
              height: 48.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
