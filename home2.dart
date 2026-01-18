import 'package:flutter/material.dart';
import 'drawer.dart';
import 'trying.dart';
import 'addtask.dart';
class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  Future tasks()async{}
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text("search space",style: TextStyle(color: Colors.black),),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: tasks(),
              builder: (context, asyncSnapshot) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NoteDetailsScreen()));
                      },
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "عنوان الملاحظة",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    SizedBox(height: 6),

                                    Text(
                                      "هذا نص تجريبي لمحتوى الملاحظة يظهر كسطر أو سطرين فقط...",
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      children: const [
                                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                                        SizedBox(width: 4),
                                        Text(
                                          "12 Jan 2026",
                                          style: TextStyle(color: Colors.grey, fontSize: 12),
                                        ),
                                        Spacer(),
                                        Icon(Icons.star_border, color: Colors.amber),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NoteDetailsScreen()));
                      },
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "عنوان الملاحظة",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      "هذا نص تجريبي لمحتوى الملاحظة يظهر كسطر أو سطرين فقط...",
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      children: const [
                                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                                        SizedBox(width: 4),
                                        Text(
                                          "12 Jan 2026",
                                          style: TextStyle(color: Colors.grey, fontSize: 12),
                                        ),
                                        Spacer(),
                                        Icon(Icons.star_border, color: Colors.amber),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NoteDetailsScreen()));
                      },
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "عنوان الملاحظة",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      "هذا نص تجريبي لمحتوى الملاحظة يظهر كسطر أو سطرين فقط...",
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      children: const [
                                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                                        SizedBox(width: 4),
                                        Text(
                                          "12 Jan 2026",
                                          style: TextStyle(color: Colors.grey, fontSize: 12),
                                        ),
                                        Spacer(),
                                        Icon(Icons.star_border, color: Colors.amber),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NoteDetailsScreen()));
                      },
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "عنوان الملاحظة",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      "هذا نص تجريبي لمحتوى الملاحظة يظهر كسطر أو سطرين فقط...",
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      children: const [
                                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                                        SizedBox(width: 4),
                                        Text(
                                          "12 Jan 2026",
                                          style: TextStyle(color: Colors.grey, fontSize: 12),
                                        ),
                                        Spacer(),
                                        Icon(Icons.star_border, color: Colors.amber),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (context) => AddTaskDialog());
        },
          child: Icon(Icons.add_task,color: Colors.white,),backgroundColor: Colors.blue,),

        bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.house),label: "الرئيسية"),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: "الإعدادت"),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: "حسابي"),
              ]),
      ),
    );
  }
}
