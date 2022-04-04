import 'package:advance_todo_app/provider/add_task_prov.dart';
import 'package:advance_todo_app/provider/user_prov.dart';
import 'package:advance_todo_app/utils/constants.dart';
import 'package:advance_todo_app/widgets/dismissible_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0, yOffset = 0, scaleFactor = 1, borderRad = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRad),
      ),
      width: double.infinity,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      child: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
          borderRadius: BorderRadius.circular(borderRad),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              isDrawerOpen
                  ? IconButton(
                      padding: const EdgeInsets.only(right: 100),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                          borderRad = 0;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black54,
                      ))
                  : IconButton(
                      padding: const EdgeInsets.only(
                        right: 100,
                      ),
                      onPressed: () {
                        setState(() {
                          xOffset = 350;
                          yOffset = 150;
                          scaleFactor = 0.8;
                          isDrawerOpen = true;
                          borderRad = 55;
                        });
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black54,
                      ),
                    ),
              const SizedBox(height: 20),
              Consumer<UserInfoProv>(
                  builder: (context, data, _) => Text(
                        "What's Up, ${data.loggedInUserInfo!.displayName!.split(" ")[0]}!",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      )),
              Image.asset('assets/images/home_screen.png'),
              const Text(
                "Today's Tasks",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 3),
              ),
              Consumer<AddTaskProv>(
                builder: (context, tasksList, _) => tasksList.allTasks.isEmpty
                    ? Image.asset('assets/images/add_more_tasks.png')
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => DismissibleWidget(
                                  index: index,
                                ),
                            itemCount: tasksList.allTasks.length),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
