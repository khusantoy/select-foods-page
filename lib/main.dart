import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> foods = [
    {"id": 1, "icon": "🍔", "label": "Burger"},
    {"id": 2, "icon": "🍟", "label": "Fries"},
    {"id": 3, "icon": "🌯", "label": "Buritto"},
    {"id": 4, "icon": "🌮", "label": "Taco"},
    {"id": 5, "icon": "🍕", "label": "Pizza"},
    {"id": 6, "icon": "🍣", "label": "Sushi"},
    {"id": 7, "icon": "🍳", "label": "Egg &  bacon"},
    {"id": 8, "icon": "🍆", "label": "Egg plant"},
    {"id": 9, "icon": "🍖", "label": "Meat"},
    {"id": 10, "icon": "🍦", "label": "Ice cream"},
    {"id": 11, "icon": "🍰", "label": "Cake"},
    {"id": 12, "icon": "🍪", "label": "Cookies"},
    {"id": 13, "icon": "🍩", "label": "Donut"},
    {"id": 14, "icon": "☕️", "label": "Coffee"},
  ];

  List<Map<String, dynamic>> selectedFoods = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select Foods",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Foods & Drinks",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              foods.isEmpty
                  ? const Text(
                      "No Foods",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    )
                  : Wrap(
                      spacing: 10,
                      children: [
                        for (var food in foods)
                          GestureDetector(
                            child: Chip(
                              avatar: Text(
                                food['icon'],
                              ),
                              label: Text(
                                food['label'],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            onTap: () {
                              selectedFoods.add(food);
                              foods.remove(food);
                              setState(() {});
                            },
                          ),
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "In Cart",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      foods += selectedFoods;
                      selectedFoods.clear();
                      setState(() {});
                    },
                    child: const Text(
                      "Delete All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              selectedFoods.isEmpty
                  ? const Text(
                      "No Selected Foods",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    )
                  : Wrap(
                      spacing: 10,
                      children: [
                        for (var food in selectedFoods)
                          Chip(
                            avatar: Text(food['icon']),
                            label: Text(
                              food['label'],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onDeleted: () {
                              foods.add(food);
                              selectedFoods.remove(food);
                              setState(() {});
                            },
                          ),
                      ],
                    ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            height: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
