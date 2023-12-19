//import 'dart:js_interop';

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:telephoneapp/models/facultyindividual.dart';
import 'package:telephoneapp/models/department.dart';



import 'package:telephoneapp/screens/uidetails.dart';


List<facultyindividual> allindividuals=[];
List<department> alldepartments=[];

String name="";
int _dropdownvalue=-1;

class SearchMenu extends StatefulWidget
{
 const SearchMenu({super.key});
 
 
 @override
 State<SearchMenu> createState()
 {
  return _SearchMenuState();
 }
}

class _SearchMenuState extends State<SearchMenu>
{
var nametext= TextEditingController();
var topictext=TextEditingController();
bool isapicall=false;
bool isdepartment=false;
List<facultyindividual> filteredlist=[];


Future<void> _fetchdepartments() async
{
  final url=Uri.parse("http://telephone.nitk.ac.in/api/v1/departments");
  final response= await http.get(url);

  final data= jsonDecode(response.body);
  if(response.statusCode ==200)
 {
 for(final i in data)
 {
  alldepartments.add(department.fromJson(i));
  
 }
print(alldepartments.length);
}
else
{
  print('Failed to load');
}
}

Future<void> _fetchindividuals() async{

final url= Uri.parse("http://telephone.nitk.ac.in/api/v1/faculties");
final Response=await http.get(url);

final data= jsonDecode(Response.body);
print(data);
 if(Response.statusCode ==200)
 {
 for(final i in data)
 {
  allindividuals.add(facultyindividual.fromJson(i));
  
 }
 setState(() {
    isapicall=true;
  });
print(allindividuals.length);
}
else
{
  print('Failed to load');
}
allindividuals.sort();
}

void filteredlistonparameters(String name, int departmentid){
setState(() {
   filteredlist =allindividuals.where((element)
   {
if(name==  "" && departmentid == -1)
{
  return true;
}
else
{
  if(name != "" && departmentid== -1)
  {
   return element.name!.toLowerCase().contains(name.toLowerCase());
  }
  else if (name=="" && departmentid != -1)
  {
    return element.departmentId==departmentid;
  }
  else if(name != "" && departmentid != -1)
  {
    return  element.name!.toLowerCase().contains(name.toLowerCase()) && element.departmentId==departmentid;
  }
}
return false;
   }).toList();
   
   
  /*  filteredlist = completelist.where((element){
if(n=="n" && i != -1)
{
  return element.departmentId==i?true:false;
}
else
if(n != "n" && i == -1)
{
  return element.name == n;
}
else
if(n!= "n" && i != -1)
{
  return element.name==n && element.departmentId==i;
}
return true;
 }).toList();
*/
});
 
}

String name="";
int _dropdownvalue=-1;

@override
void dispose(){
  nametext.dispose();
  topictext.dispose();
  super.dispose();
}
@override
void initState() {
  _fetchindividuals();
 // _fetchdepartments();
    filteredlist=allindividuals;
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {

    Widget content = isapicall ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                              const SizedBox(height: 5,),
                         
                            Container(
                             padding: const EdgeInsets.all(6),
                              child: TextField(
                                
                                controller: nametext,
                                onChanged: (value){
                                  name=value;
                                  filteredlistonparameters(name, _dropdownvalue);},
                                 decoration: InputDecoration(
                                  labelText:  "Name" ,
                                  labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                  focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    gapPadding:1,
                                    borderSide: const BorderSide(width: 2,color:Color.fromARGB(255,244,220,194) ),
                                                 ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    gapPadding:5,
                                    borderSide: const BorderSide(width: 2,color:Color.fromARGB(255,201,112,72) ),
                                  ),
                                  disabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    gapPadding:5,
                                    borderSide: const BorderSide(width: 2,color:Color.fromARGB(255, 110, 109, 109) ),
                                  ),
                                 // hintText: "Enter the name",
                                 ),
                                 ),
                            ),
                            const SizedBox(height: 5,),
                           const Row(
                            children: 
                                   [
                                    SizedBox(width: 10,),
                                    ]),
                         
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [ 
                                ElevatedButton(onPressed: () async{
                                  await showModalBottomSheet(
                                    elevation: 15,
                                    context: context, 
                                    builder: (context) {
                                      return Column(
                                        children: [
                                          const SizedBox(height: 21,),
                                           const Row(children: [SizedBox(width: 10,),
                                     Text("Branch"),]),
                                     const SizedBox(height: 4,),
                            Row(
                              children: 
                                   [ const SizedBox(width: 10,),
                                      DropdownButton(

                               hint: const Text("Select the branch"),
                               elevation: 8,
                                 items: const[
                                  DropdownMenuItem( child: Text("Select the branch"), value:-1,),
                                   DropdownMenuItem( child: Text("Computer Science"), value:1,),
                                     DropdownMenuItem( value: 2 ,child: Text("Civil"),),
                                      DropdownMenuItem( value: 3 ,child: Text("Information Technology"),),
                                       DropdownMenuItem( value: 6 ,child: Text("Water resources and Ocean Eng"),),
                                        DropdownMenuItem( value: 7 ,child: Text("Chemical"),),
                                         DropdownMenuItem( value: 8 ,child: Text("Chemistry"),),
                                          DropdownMenuItem( value: 9 ,child: Text("Electrical and Electronics"),),
                                           DropdownMenuItem( value: 10 ,child: Text("Electrical and Communication"),),
                                            DropdownMenuItem( value: 11 ,child: Text("MACS"),),
                                          DropdownMenuItem( value: 12 ,child: Text("Mechanical Engineering"),),
                                       DropdownMenuItem( value: 13 ,child: Text("Metallurgical and Materials Engineering"),),
                                      DropdownMenuItem( value: 14 ,child: Text("Mining"),),
                                    DropdownMenuItem( value: 15 ,child: Text("Physics"),),
                                  DropdownMenuItem( value: 16 ,child: Text("School of Humanitics, Social Sciences, \n and Management")),
                                  DropdownMenuItem( value: 17 ,child: Text("CDC"),),
                                  DropdownMenuItem( value: 18 ,child: Text("Central Library"),),
                                  ] ,
                                  value: _dropdownvalue,
                                 onChanged:
                                 (newvalue)
                                 {
                                 _dropdownvalue=newvalue!;
                                 filteredlistonparameters(name, _dropdownvalue);
                                 Navigator.pop(context);
                                 } 
                                  ),
                                  ])

                                        ],
                                      );
                                    },);

                                  }, child: const Text("Filters", style: TextStyle(color: Colors.white),),
                                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255,201,112,72))),
                                  ),
                                  const SizedBox(width: 9,),
                                  
                                  TextButton(onPressed: (){
                                         setState(() {
                                           filteredlistonparameters("", -1);
                                           nametext.text="";
                                         });    
                                    
                                  },
                                    child: const Text("Reset",style: TextStyle(color: Colors.black),))
                              ],
                            ),
                Expanded(
                child:  ListView.builder(
        itemCount: filteredlist.length,
 itemBuilder:(context, index){
         return Container(
          height: 80,
          padding: const EdgeInsets.only(left: 7,right: 7,top: 3,bottom: 3),
          child: Card(
            child: Row(
              children: [
                const SizedBox(width: 10,),
                Text("${index+1}"),
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name:${filteredlist[index].name}"),
                  
                                       Text("Landline: ${filteredlist[index].mobile2.toString()}"),                   
                      Text("Mobile: ${filteredlist[index].mobile1.toString()}"),
                  ],
                ),
                const Spacer(),
               IconButton(onPressed: ()
               {
           Navigator.push(context, MaterialPageRoute(builder: (context) =>Info(userDetails: filteredlist[index])),);
               }, icon: const Icon(Icons.person))
              ],
            ),
            
          ) 
      ,);
     }, 
    )
   ), 
            ],
             ): const Center(child: CircularProgressIndicator(color:  Color.fromARGB(255,201,112,72), ));
    return Scaffold(
       appBar: AppBar(
                       title: const Text("Telephone Directory",style: TextStyle(color: Colors.white),),
                       backgroundColor: const  Color.fromARGB(255,201,112,72),
                       centerTitle: true,
                      ),
             body: content ,
              
    );
  }
}  
