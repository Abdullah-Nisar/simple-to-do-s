import 'package:flutter/material.dart';
import 'package:to_dos_state_management/models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  ScrollController? scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Master Plan'),
        ),
      ),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan.tasks.add(
            (Task()),
          );
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks, index),
    );
  }

  Widget _buildTaskTile(List tasks, int index) {
    return ListTile(
      leading: Checkbox(
        value: tasks[index].complete,
        onChanged: (selected) {
          setState(() {
            tasks[index].complete = selected!;
          });
        },
      ),
      title: TextField(onChanged: (text) {
        setState(() {
          tasks[index].description = text;
        });
      }),
      trailing: GestureDetector(
        child: Icon(Icons.arrow_forward_ios),
        onTap: () {
          setState(() {
            tasks.remove(tasks[index]);
          });
        },
      ),
    );
  }
}
