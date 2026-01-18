import 'package:flutter/material.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      title: Row(
        children: const [
          Icon(Icons.warning_amber_rounded, color: Colors.red),
          SizedBox(width: 8),
          Text("حذف المهمة"),
        ],
      ),
      content: const Text(
        "هل أنت متأكد أنك تريد حذف هذه المهمة؟\nلا يمكن التراجع عن هذا الإجراء.",
        style: TextStyle(height: 1.4),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("إلغاء"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            // هنا كود الحذف من قاعدة البيانات
            Navigator.pop(context);
          },
          child: const Text("حذف"),
        ),
      ],
    );
  }
}