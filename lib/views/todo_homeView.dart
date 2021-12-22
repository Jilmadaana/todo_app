import 'package:flutter/material.dart';
import 'package:toffe/delete%20_alert.dart';
import 'package:toffe/views/createTodo.dart';


class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  

  @override
  Widget build(BuildContext context) {
    int _currentIndex =0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        
        elevation: 30,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("TODO App",
        style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(onPressed: (){}, icon: Icon (Icons.notifications_none_outlined,)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
      
         onTap: (index){
           setState((){
             _currentIndex= index;
           });
         },
        items: [
        BottomNavigationBarItem(
          icon:Icon(Icons.home,color: Colors.black,), label: "Home"),
        BottomNavigationBarItem(
          icon:Icon(Icons.check_circle,color: Colors.black),
           label: "completed Todo"),
        BottomNavigationBarItem(
          icon:Icon(Icons.check_circle_outlined,color: Colors.black,), 
          label: "uncompleted Todo"),
        BottomNavigationBarItem(
          icon:Icon(Icons.settings_applications,color: Colors.black,),
           label: "Settings"),
        BottomNavigationBarItem(
          icon:Icon(Icons.person,color: Colors.black,), label: "User"),
      ]),


      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).
        pop(MaterialPageRoute(builder: (context) => CreateTodo()));
      },backgroundColor:
        Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Icon(Icons.add)),
        body: ListView.separated(itemBuilder: (context,index){
          return Dismissible(key: ValueKey(index),
          direction: DismissDirection.startToEnd,
          confirmDismiss: (direction) async{
            var results = await showDialog(context: context,
           builder: (context)=> const DeleteAlert());
            return results;
          },
          background: Container(color: Colors.red, child: Icon(Icons.delete),),
            child: ListTile(
              title: Text("Trip to florida", style: Theme.of(context).textTheme.bodyText1),
              subtitle: Text("planning a trip for my siblings....",style: Theme.of(context).textTheme.bodyText2),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.check_circle)),
            ),
          );
        },
         separatorBuilder: (context, index)=>Divider(),
          itemCount:10),
    );
  }

}