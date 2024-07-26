import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class Homescreen extends StatefulWidget{
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userinput='';
  var answer='';
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.black,
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: Column(
           children: [
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20),
                 child: Align(
                   alignment: Alignment.bottomRight,
                   child: Column(
                     children: [
                       Text(userinput,style: TextStyle(
                         fontSize: 40,
                         color: Colors.white,
                       ),),
                       SizedBox(height: 14,),
                       Text(answer,style: TextStyle(
                         fontSize: 40,
                         color: Colors.white,
                       ),),
                     ],
                   ),
                 ),
               ),
             ),
             Expanded(
               flex: 2,
               child: Column(
                 children: [
                   Row(
                     children: [
                       MyButton(title: 'AC',onPress: (){
                         userinput='';
                         answer='';
                         setState(() {

                         });
                       },),
                       MyButton(title: '+/-',onPress: (){
                         userinput+='+/-';
                         setState(() {

                         });
                       },),
                       MyButton(title: '%',onPress: (){
                         userinput+='%';
                         setState(() {

                         });
                       },),
                       MyButton(title: '/',color: Color(0xffffa00a),onPress: (){
                         userinput+='/';
                         setState(() {

                         });
                       },)
                     ],
                   ),
                   Row(
                     children: [
                       MyButton(title: '7',onPress: (){
                         userinput+='7';
                         setState(() {

                         });
                       },),
                       MyButton(title: '8',onPress: (){
                         userinput+='8';
                         setState(() {

                         });
                       },),
                       MyButton(title: '9',onPress: (){
                         userinput+='9';
                         setState(() {

                         });
                       },),
                       MyButton(title: 'x',color: Color(0xffffa00a),onPress: (){
                         userinput+='x';
                         setState(() {

                         });
                       },)
                     ],
                   ),
                   Row(
                     children: [
                       MyButton(title: '4',onPress: (){
                         userinput+='4';
                         setState(() {

                         });
                       },),
                       MyButton(title: '5',onPress: (){
                         userinput+='5';
                         setState(() {

                         });
                       },),
                       MyButton(title: '6',onPress: (){
                         userinput+='6';
                         setState(() {

                         });
                       },),
                       MyButton(title: '-',color: Color(0xffffa00a),onPress: (){
                         userinput+='-';
                         setState(() {

                         });
                       },)
                     ],
                   ),
                   Row(
                     children: [
                       MyButton(title: '1',onPress: (){
                         userinput+='1';
                         setState(() {

                         });
                       },),
                       MyButton(title: '2',onPress: (){
                         userinput+='2';
                         setState(() {

                         });
                       },),
                       MyButton(title: '3',onPress: (){
                         userinput+='3';
                         setState(() {

                         });
                       },),
                       MyButton(title: '+',color: Color(0xffffa00a),onPress: (){
                         userinput+='+';
                         setState(() {

                         });
                       },)
                     ],
                   ),
                   Row(
                     children: [
                       MyButton(title: '0',onPress: (){
                         userinput+='0';
                         setState(() {

                         });
                       },),
                       MyButton(title: '.',onPress: (){
                         userinput+='.';
                         setState(() {

                         });
                       },),
                       MyButton(title: 'Del',onPress: (){
                         userinput=userinput.substring(0,userinput.length -1);
                         setState(() {

                         });
                       },),
                       MyButton(title: '=',color: Color(0xffffa00a),onPress: (){
                         equalPress();  
                         setState(() {

                         });
                       },)
                     ],
                   ),
                 ],
               ),
             )

           ],
         ),
       ),
     ),
   );
  }

  void equalPress (){
    String finaluserinput=userinput;
    finaluserinput=userinput.replaceAll('x', '*');
    Parser p=Parser();
    Expression expression=p.parse(finaluserinput);

    ContextModel contextModel=ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer=eval.toString();

  }
}