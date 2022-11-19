import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  final List<String> fooditem = ['Fish', 'Food', 'Rice'];
  final List<String> Fish = ['Fish1', 'Fish2', 'Fish3'];
  final List<String> Food = ['Food1', 'Food2', 'Food2'];
  final List<String> Rice = ['Rice1', 'Rice2', 'Rice3'];
  @override
  late List<String> allfood;
  void initState() {
    allfood = Food;

    super.initState();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int selectedIndex = 1;
    // List<String> allfood = Food;

    return Scaffold(
      appBar: AppBar(
        title: Text("Food App"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // setState(() {

            showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            itemCount: fooditem.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  selectedIndex = index;
                                  // print(fooditem[index]);
                                  if (fooditem[index] == 'Fish') {
                                    allfood = Fish;
                                    ;
                                  } else if (fooditem[index] == 'Food') {
                                    allfood = Food;
                                    ;
                                  } else if (fooditem[index] == 'Rice') {
                                    allfood = Rice;
                                  }
                                  print(selectedIndex);
                                  print(fooditem[selectedIndex]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Chip(
                                    //

                                    backgroundColor: index == selectedIndex
                                        ? Colors.blue
                                        : Colors.grey,
                                    label: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        fooditem[index],
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 2.4, vertical: 30),
                              child: Text(allfood[index])),
                          itemCount: allfood.length,
                        ))
                      ],
                    );
                  },
                );
              },
            );
            // });
          },
          child: Text("Show Food list"),
        ),
      ),
    );
  }
}
