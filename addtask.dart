import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  DateTime taskDate = DateTime.now();
  DateTime addDate = DateTime.now();
  TimeOfDay reminderTime = TimeOfDay.now();

  bool enableReminder = false;
  String selectedCategory = "عام";

  final List<String> categories = [
    "عام",
    "دراسة",
    "عمل",
    "شخصي",
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// العنوان
            const Center(
              child: Text(
                "إضافة مهمة / ملاحظة",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// عنوان المهمة
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
              maxLines: 3,
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
                setState(() {
                  selectedCategory = value!;
                });
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
                DateFormat('yyyy/MM/dd').format(taskDate),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                  initialDate: taskDate,
                );
                if (date != null) {
                  setState(() => taskDate = date);
                }
              },
            ),

            /// تاريخ الإضافة
            Text(
              "تاريخ الإضافة: ${DateFormat('yyyy/MM/dd').format(addDate)}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            /// التذكير
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("تفعيل التنبيه"),
              value: enableReminder,
              onChanged: (value) {
                setState(() => enableReminder = value);
              },
            ),

            if (enableReminder)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("وقت التنبيه"),
                subtitle: Text(reminderTime.format(context)),
                trailing: const Icon(Icons.alarm),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: reminderTime,
                  );
                  if (time != null) {
                    setState(() => reminderTime = time);
                  }
                },
              ),

            const SizedBox(height: 16),

            /// الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("إلغاء"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // هنا تضيف الحفظ في الداتابيس
                    Navigator.pop(context);
                  },
                  child: const Text("حفظ"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}