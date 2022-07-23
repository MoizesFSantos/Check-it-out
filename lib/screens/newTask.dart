import 'package:checkitout/repositories/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var _categories = <DropdownMenuItem>[];

  getCategories() async {
    var categories = await context.read<CategoryRepository>().getAll();
    categories.forEach((category) {
      setState(() {
        _categories.add(
          DropdownMenuItem(
            child: Text(categories['title']),
            value: category,
          ),
        );
      });
    });
  }

  var _selectedValue;

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Title'),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pickDate(context);
                    },
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.indigo,
                      size: 36,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '${date.day}/${date.month}/${date.year}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pickTime(context);
                    },
                    icon: Icon(
                      Icons.access_time,
                      color: Colors.indigo,
                      size: 36,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '${time.hour}:${time.minute}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField<dynamic>(
                value: _selectedValue,
                items: _categories,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                hint: Text('Category'),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 8, minute: 0);
    final newTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (newTime == null) return;
    setState(() => time = newTime);
  }
}
