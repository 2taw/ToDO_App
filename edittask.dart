import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditTaskScreen extends StatefulWidget {
  final String title;
  final String content;
  final String category;
  final DateTime taskDate;
  final bool reminderEnabled;
  final TimeOfDay reminderTime;

  const EditTaskScreen({
    super.key,
    required this.title,
    required this.content,
    required this.category,
    required this.taskDate,
    required this.reminderEnabled,
    required this.reminderTime,
  });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  late DateTime selectedDate;
  late bool enableReminder;
  late TimeOfDay selectedTime;

  String selectedCategory = "عام";

  final categories = ["عام", "دراسة", "عمل", "شخصي"];

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    contentController = TextEditingController(text: widget.content);
    selectedDate = widget.taskDate;
    enableReminder = widget.reminderEnabled;
    selectedTime = widget.reminderTime;
    selectedCategory = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تعديل المهمة"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // حذف المهمة
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// العنوان
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "العنوان",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            /// المحتوى
            TextField(
              controller: contentController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "المحتوى",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            /// التصنيف
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories
                  .map(
                    (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
                  .toList(),
              onChanged: (value) {
                setState(() => selectedCategory = value!);
              },
              decoration: const InputDecoration(
                labelText: "التصنيف",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            /// تاريخ المهمة
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("تاريخ المهمة"),
              subtitle: Text(
                DateFormat('yyyy/MM/dd').format(selectedDate),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() => selectedDate = date);
                }
              },
            ),

            /// التنبيه
            SwitchListTile(
              title: const Text("تفعيل التنبيه"),
              value: enableReminder,
              onChanged: (value) {
                setState(() => enableReminder = value);
              },
            ),

            if (enableReminder)
              ListTile(
                title: const Text("وقت التنبيه"),
                subtitle: Text(selectedTime.format(context)),
                trailing: const Icon(Icons.alarm),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (time != null) {
                    setState(() => selectedTime = time);
                  }
                },
              ),

            const SizedBox(height: 24),

            /// زر الحفظ
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("حفظ التعديلات"),
                onPressed: () {
                  // حفظ التعديلات في الداتابيس
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}