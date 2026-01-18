import 'package:flutter/material.dart';
import 'home2.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text("الملاحظة",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            icon:  IconButton(
              onPressed:(){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => Home2()));
              },icon:Icon(Icons.edit,color: Colors.black,size: 30,),),
            onPressed: () {
              // لاحقًا: منطق التعديل / الحفظ
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان الملاحظة
            TextField(
              decoration: const InputDecoration(
                hintText: "عنوان الملاحظة",
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // التاريخ
            Row(
              children: const [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "12 Jan 2026",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const Divider(height: 32),

            // محتوى الملاحظة
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: "اكتب ملاحظتك هنا...",
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}