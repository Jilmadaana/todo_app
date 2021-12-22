import 'package:flutter/material.dart';


class CreateTodo extends StatelessWidget {
  const CreateTodo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
        return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Create Todo",
        style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Form( autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextField(
                  style: Theme.of(context).textTheme.headline2,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Todo Title ",
                  ),
                ),
                Container(height: 15,),
                TextField(
                  style: Theme.of(context).textTheme.headline2,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Body of Todo ",
                   ),
            ),
            TextField( decoration: InputDecoration(
              labelText: " Start Date",
            suffixIcon: Icon(Icons.date_range)
            ),
              onTap: () async {
             DateTime? result = await showDatePicker
             (context: context, initialDate:
              DateTime.now(), firstDate: DateTime.now(), 
              lastDate: DateTime(2024));
              }
            
            ,),
             TextField( decoration: InputDecoration(
              labelText: " End Date",
            suffixIcon: Icon(Icons.date_range)
            ),
              onTap: () async {
             DateTime? result = await showDatePicker
             (context: context, initialDate:
              DateTime.now(), firstDate: DateTime.now(), 
              lastDate: DateTime(2024));
              }
            
            ,),
            ElevatedButton(style: ButtonStyle(
              backgroundColor: Theme.of(context).elevatedButtonTheme.style?.backgroundColor,
            ),
              onPressed: (){}, 
            child: Text("Create Todo", 
            style: Theme.of(context).textTheme.bodyText1,))
            
          //  InputDatePickerFormField(firstDate: DateTime(1990), lastDate: DateTime.now())
            ]
            )
            ),
          )
        ],
      ),
    );
  }
}