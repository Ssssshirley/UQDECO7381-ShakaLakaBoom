import 'package:flutter/material.dart';
import 'package:quiz/widgets/chart.dart';
import '../../widgets/new_activity.dart';
import '../../widgets/activities_list.dart';
import '../../models/activity.dart';
import '../../models/activitySelect.dart';

final List<Activity> activities = [
  // Activity(
  //   id: 'a1',
  //   title: 'Bus',
  //   amount: 0.96,
  //   description: "Transport",
  //   icon: Icons.emoji_transportation,
  // ),
  // Activity(
  //   id: 'a2',
  //   title: 'Meat',
  //   amount: 0.22,
  //   description: "Food",
  //   icon: Icons.food_bank,
  // ),
];

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  // String titleInput = '@@';
  // String amountInput = '@@';
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  // final List<Activity> activities = [
  //   Activity(
  //     id: 'a1',
  //     title: 'Bus',
  //     amount: 0.96,
  //     description: "Transport",
  //   ),
  //   Activity(
  //     id: 'a2',
  //     title: 'Meat',
  //     amount: 0.22,
  //     description: "Food",
  //   ),
  // ];

  void _addNewActivity(String title, double amount) {
    final newActivity = Activity(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      description: "Manually Added",
      icon: Icons.energy_savings_leaf_rounded,
    );

    setState(
      () {
        activities.add(newActivity);
      },
    );
  }

  void _startAddNewActivity(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (buildingContext) {
        return NewActivity(_addNewActivity);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return const Text("ActivitiesPageqwdqwdqqd");
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.add,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Image.network(
            //   'https://lh3.googleusercontent.com/uhrRF8YgyxjOkRzf17bllFTmk2VQ1kfayobZH37Dux-tAzPsg-AfFbmjjyvuvLbQh6_2JPAp7-BYHLyHhB3BfpnhjGjJH21LuwadJxlKSjHT7S205MB7rppGzMmccCvUz-8_7qktBp1GuzUm4nLJ9k7HwSsBK2mvEsLdO7GOYQL-7myHQHqggK3ZBQW7sqj6bxutjD6fLIzN4bGnlm35aLpSwVwGIeLQAtcqhMiNaN7FG-IMRKoiwQuiFdVfepj1_jGjg2V7xooLl5EEV2v5Qzkr8apPwAgj8rA1LsNyHmF5L6WrRSIo7in3K9oM80MjBbQOuG72lUXxWs1mvv1mjZKMpyYq3c5F8H49dnjWFFN-Q9s_CtQnvyhXQIlsZFLcWbVMKUiIMM0RkAnlBU8rzt22qresbIyVmwbZvryqVyzgBLFc9WJIkTRoHbkVjvh2PLGRP-_FlRdv5JdY1qBCE-tzTSpPxLQdrDbC54RQoofdE8Cklr8XbU94D8jYCWUFCu87x6-AWLGKoxh_8iCktYY1yb4He_lbbpYffpd8nNlfIRC4Gx6cfIrpToBDBXSwsrLJi_QRazDlZJk_Yu194l9yaZzLdjB56vjoNokfV0eoOVYpa3wZNrciLbkbfwpmBox_Cgk38k2WsBX0j7tmwKLbkjV6lUVwvJLemJgJNzNqLcN7_SUEDczPelvPHrBVXllfLTBUSbLXLnJow3dhZXfdYwU9hKKyReNjvnz8R1PrY14BmNRL8aQydvSGKKiyxxP_Pbeuw4naXgdbRNdyD-9KoHYQXKzahs2H=w361-h220-no?authuser=0',
            //   height: 250,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            // Container(
            //   width: double.infinity,
            //   child: Card(
            //     color: Colors.green,
            //     child: Text('CHART!'),
            //     //shadow
            //     elevation: 5,
            //   ),
            // ),
            Chart(activities),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () async {
                  final reload = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => _ActivitiesPageState2(),
                    ),
                  );

                  setState(() {});
                },
                child: Text("Select Activities"),
              ),
            ),
            // NewActivity(),
            // ActivitiesList(),
            ActivitiesList(activities),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewActivity(context),
        backgroundColor: Colors.green,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _ActivitiesPageState2 extends StatefulWidget {
  @override
  State<_ActivitiesPageState2> createState() => _ActivitiesPageState2State();
}

class _ActivitiesPageState2State extends State<_ActivitiesPageState2> {
  List<ActivitySelect> activitiesForSelect = [
    ActivitySelect(
      "Laundry",
      "Energy",
      false,
      Icons.local_laundry_service,
      0.21,
    ),
    ActivitySelect(
      "Pescatarian",
      "Food",
      false,
      Icons.food_bank,
      0.34,
    ),
    ActivitySelect(
      "Light",
      "Energy",
      false,
      Icons.light_mode,
      0.51,
    ),
    ActivitySelect(
      "Bus",
      "Transport",
      false,
      Icons.bus_alert,
      0.82,
    ),
    ActivitySelect(
      "Car",
      "Transport",
      false,
      Icons.car_crash,
      0.77,
    ),
    ActivitySelect(
      "Meat",
      "Food",
      false,
      Icons.food_bank_sharp,
      0.49,
    ),
    ActivitySelect(
      "Vegetarian",
      "Food",
      false,
      Icons.food_bank_sharp,
      0.93,
    ),
    ActivitySelect(
      "Walk",
      "Transport",
      false,
      Icons.nordic_walking,
      0.58,
    ),
    ActivitySelect(
      "Bicycle",
      "Transport",
      false,
      Icons.pedal_bike,
      0.36,
    ),
  ];

  List<ActivitySelect> activitiesSelected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("go_eco"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: activitiesForSelect.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ActivityItem(
                        activitiesForSelect[index].name,
                        activitiesForSelect[index].description,
                        activitiesForSelect[index].isSelected,
                        index,
                        activitiesForSelect[index].icon,
                        activitiesForSelect[index].amount,
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text("Confirm Add (${activitiesSelected.length})",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    onPressed: () {
                      activitiesSelected.forEach(
                        (activity) {
                          activities.add(
                            Activity(
                              id: "shit",
                              title: activity.name,
                              amount: activity.amount,
                              description: activity.description,
                              icon: activity.icon,
                            ),
                          );
                        },
                      );

                      // not working at all
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => ActivitiesPage(),
                        ),
                      );
                      // setState(
                      //   () {
                      //   },
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ActivityItem(
    String name,
    String description,
    bool isSelected,
    int index,
    IconData icon,
    double amount,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(description),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          activitiesForSelect[index].isSelected =
              !activitiesForSelect[index].isSelected;
          if (activitiesForSelect[index].isSelected == true) {
            activitiesSelected.add(ActivitySelect(
              name,
              description,
              true,
              icon,
              amount,
            ));
          } else if (activitiesForSelect[index].isSelected == false) {
            activitiesSelected.removeWhere(
                (element) => element.name == activitiesForSelect[index].name);
          }
        });
      },
    );
  }
}
