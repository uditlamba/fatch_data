import 'dart:convert';
import 'package:fatch_data/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getData();
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return GetBuilder<HomeController>(
     init: homeController,
     builder: (controller) {
       return Scaffold(
                appBar: AppBar(
                  title: const Text("Get Data"),
                  backgroundColor: Colors.blue,
                ),
                body: controller.apiData.isEmpty? const Center(child: Text('No data found')):
                ListView.builder(
                  itemCount: controller.apiData.length,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      color: Colors.green.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Id: ${controller.apiData[i].id}",
                              style: const TextStyle(fontSize: 30),
                            ),
                            Text(
                              "Title: ${controller.apiData[i].title}",
                              style: const TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
       );
     }
   );
  }
}
