import 'package:flutter/material.dart';

import '../models/device.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  List deviceList = [
    Device("name", "device1", true),
    Device("name", "device2", true),
    Device("name", "device3", false),
    Device("name", "device4", false),
    Device("name", " device5", true),
    Device("name", "device4", false),
    Device("name", " device5", false),
    Device("name", "device4", true),
    Device("name", " device5", false),
    Device("name", "device4", false),
    Device("name", " device5", true),
    Device("name", "device4", true),
    Device("name", " device5", false),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.login)],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.09),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: _addDeviceForm,
                    child: Text(
                      "Add device",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Expanded(
              child: Material(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: deviceList.length,
                    itemBuilder: (context, deviceIndex) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {},
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.grey, width: 1),
                            ),
                            tileColor: Colors.white,
                            leading: Icon(Icons.phone_android_outlined),
                            title: Row(children: [
                              Container(
                                  width: 250,
                                  child: Text(deviceList[deviceIndex].name)),
                              SizedBox(width: 20),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: deviceList[deviceIndex].status
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ]),
                            subtitle: Text(deviceList[deviceIndex].id),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      color: Colors.red,
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.remove_circle_outline_outlined))
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(9),
              child: Center(
                child: Text("Footer"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addDeviceForm() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Device name",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Model ID",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(onPressed: () {}, child: Text("Add")),
                  )
                ],
              ),
            ));
  }
}
