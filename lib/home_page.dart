import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text('Hi, UserName.'),
        actions: [
          IconButton(
            icon: const Icon(Icons.alarm_add_outlined),
            tooltip: 'Notification',
            onPressed: () {
              
            },
            
          ),
        ],
      ),

      //navigation bar
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
         onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
         },
         indicatorColor: const Color.fromARGB(255, 244, 191, 32),
         selectedIndex: currentPageIndex,
         destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.notifications_sharp),
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Notifications',
            ),
            NavigationDestination(
              selectedIcon: Badge(
                label: Text('2'),
                child: Icon(Icons.messenger),
              ),
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.messenger_outline),
              ),
              label: 'Messages',
            ),
         ],
        ),

        body: <Widget>[
          Card(
            shadowColor: Colors.transparent,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Center(
                child: Text(
                  'Home page',
                ),
              ),
            ),
          ),

          ///notification page
          const Padding(
            padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.notifications_sharp),
                      title: Text('Notification 1'),
                      subtitle: Text('This is a notification'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.notifications_sharp),
                      title: Text('Notification 2'),
                      subtitle: Text('This is a notification'),
                    ),
                  ),
                ],
              ),
            ),

            ///Message page
            ListView.builder(
              reverse: true,
              itemCount: 2,
              itemBuilder: (BuildContext context , int index){
                if(index == 0){
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8.0), 
                      ),
                      child: Text(
                        'Hellow',
                      ),
                    ),
                  );
                }
                return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8.0), 
                      ),
                      child: Text(
                        'HI!',
                      ),
                    ),
                  );
              }
            )
        ][currentPageIndex],
    );
  }
}