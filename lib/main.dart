import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Add, Subtract, Multiply'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 60;

  Timer? timer;
  bool flag=false;

  int mode=1;
  int first_var=0;
  int second_var=0;
  bool new_option= false;
  int option_a= 0;
  int option_b = 0;
  int option_c = 0;
  int option_d = 0;

  int result=0;
  int position=0;
  int randomNumber = 0;
  int tapped=0;

  int max_counter=60;



  String mode_string='+';

  int score=0;

  bool end=false;

  void stopTime()
  {
    timer!.cancel();

    setState(() {
      _counter=max_counter;
      end=true;
      flag=false;
    });
  }

  void Reset(){
    setState(() {
      _counter=max_counter;
      score=0;
      tapped=0;
    });
  }

  void set_question(int point){

    if(flag==true) {
      setState(() {
        if(point!=5)
        tapped++;
        switch(point)
        {
          case 1 :
            {
              if(result==option_a)
                score++;
            }break;
          case 2 :
            {
              if(result==option_b)
                score++;

            }break;
          case 3 :
            {
              if(result==option_c)
                score++;

            }break;
          case 4 :
            {
              if(result==option_d)
                score++;

            }break;
          case 5 :
            break;

        }

        Random random = new Random();
        randomNumber = random.nextInt(90) + 10;

        mode = random.nextInt(3) + 1;

        if (mode == 1)
          mode_string = '+';
        else if (mode == 2)
          mode_string = '-';
        else
          mode_string = '*';

        if(mode_string=='*'){

          if(_counter<=60&&_counter>30){
            first_var = random.nextInt(20);
            second_var = random.nextInt(20);
          }
          else if(_counter<=30&&_counter>10)
          { first_var = random.nextInt(30)+20;
          second_var = random.nextInt(30)+20;


          }
          else {
            first_var = random.nextInt(50) + 30;
            second_var = random.nextInt(50) + 30;
          }

        }
    else{

      if(_counter<=60&&_counter>30){
        first_var = random.nextInt(100);
        second_var = random.nextInt(100);
      }
      else if(_counter<=30&&_counter>10)
       { first_var = random.nextInt(200)+100;
      second_var = random.nextInt(200)+100;


        }
    else {
        first_var = random.nextInt(500) + 200;
        second_var = random.nextInt(500) + 200;
      }

    }

        switch (mode_string) {
          case '+' :
            {
              result = first_var + second_var;
            }
            break;
          case '-' :
            {
              result = first_var - second_var;
            }
            break;
          case '*' :
            {
              result = first_var * second_var;
            }
        }

        position = random.nextInt(4) + 1;
        switch (position) {
          case 1 :
            {
              option_a = result;
              option_b = random.nextInt(15) + result - 15;
              option_c = random.nextInt(15) + result - 15;
              option_d = random.nextInt(15) + result - 15;
            }
            break;
          case 2 :
            {
              option_b = result;
              option_a = random.nextInt(15) + result - 15;
              option_c = random.nextInt(15) + result - 15;
              option_d = random.nextInt(15) + result - 15;
            }
            break;
          case 3 :
            {
              option_c = result;
              option_a = random.nextInt( 15) + result - 15;
              option_b = random.nextInt( 15) + result - 15;
              option_d = random.nextInt( 15) + result - 15;
            }
            break;
          case 4 :
            {
              option_d = result;
              option_a = random.nextInt( 15) + result - 15;
              option_b = random.nextInt( 15) + result - 15;
              option_c = random.nextInt( 15) + result - 15;
            }
        }


      });
    }
  }
 void StartTimer(){

setState(() {
  flag=true;
  score=0;
  tapped=0;
  end=false;
  set_question(5);


});

timer=Timer.periodic(Duration(seconds: 1), (_) {
setState(() {

  if(_counter>0)
  _counter--;
  else
    {
      stopTime();


    }

});

});
 }



  createAlertDialog(BuildContext, context){

    return showDialog(context: context, builder: (context){
      return AlertDialog(

          title: Text("Times up!!"),
          content:
          Container(

            height: 100,
            child:Column(

              children: [
                Text('Your Score : $score/$tapped'),

                ElevatedButton(onPressed: (){

                  Navigator.pop(context);
                },child: Text('Retry'),),


              ],

            ) ,
          )

      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:


      Container(
        //height: 700,
        decoration:

        BoxDecoration(
            image:  DecorationImage(image: new AssetImage('assets/game.png'),fit: BoxFit.cover)
        ),
        child:
        Center(

            child:
            SingleChildScrollView(

              child:
                Center(
                  // Center is a layout widget. It takes a single child and positions it
                  // in the middle of the parent.

                  child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        if(_counter<max_counter&&_counter>max_counter-10)
                          Text('Go!!',style: TextStyle(
                              fontSize: 28
                          ),)
                        else if(_counter<=(max_counter/2)&&_counter>10)
                          Text('Halfway There!!',style: TextStyle(
                              fontSize: 28
                          ),)
                        else if(_counter<=10&&_counter>=0)
                            Text('Last Ride!!',style: TextStyle(
                                fontSize: 28
                            ),)
                          else if(end==true)
                              Text('Time up!!',style: TextStyle(
                                  fontSize: 28
                              ),)
                            else
                              Text(' ',style: TextStyle(
                                  fontSize: 28
                              ),),


                        //createAlertDialog(context, context),
                        SizedBox(height: 20,), //Timer
                        SizedBox(height: 100,width: 100, child:


                        Stack(
                          children: [
                            Center(
                              child:

                              Container(
                                height: 600,
                                width: 600,
                                //color: Colors.blue,
                                child:

                                // child:
                                //
                                // Text(_counter.toString(),style: TextStyle(
                                //     fontSize: 24
                                // ),),
                                CircularProgressIndicator(
                                  color: Colors.yellow,
                                  backgroundColor: Colors.indigo,
                                  strokeWidth: 20,
                                  value: (1-_counter/max_counter),
                                ),

                              ),

                            ),
                            Center(child:Text(
                              _counter.toString(),style: TextStyle(
                              fontSize: 24,

                            ),
                            )  ,)
                             ],
                            )


                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(height: 80,width: 300, child: //Question


                        Container(
                          height: 90,
                          color: Colors.lightGreenAccent,

                          child: Center(
                            child:
                            Text(first_var.toString()+mode_string+second_var.toString(),
                              style: TextStyle(
                                  fontSize: 24
                              ),),
                          ),

                        ),

                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 65,width: 150, child:

                            GestureDetector(
                              onTap: (){set_question(1);},
                              child:Container(

                                height: 90,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.greenAccent,
                                ),
                                child:   Center(
                                  child:Text(option_a.toString(),
                                    style: TextStyle(
                                        fontSize: 24
                                    ),

                                  )
                                  ,
                                ) ,
                              ),
                            )
                            ),
                            SizedBox(height: 65,width: 150, child:

                            GestureDetector(
                              onTap: (){set_question(2);},
                              child:Container(
                                  height: 90,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.lightBlueAccent,
                                  ),
                                  child:   Center(
                                    child:Text(option_b.toString(),style: TextStyle(
                                        fontSize: 24
                                    ),)
                                    ,
                                  )
                              ),
                            )
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 65,width: 150, child:

                            GestureDetector(
                              onTap: (){set_question(3);},
                              child:Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.yellowAccent,

                                  ),

                                  child:   Center(
                                    child:Text(option_c.toString(),style: TextStyle(
                                        fontSize: 24
                                    ),),
                                  )
                              ),
                            )
                            ),
                            SizedBox(height: 65,width: 150, child:

                            GestureDetector(
                              onTap:(){set_question(4);},
                              child: Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.indigoAccent,

                                  ),

                                  child:
                                  Center(
                                    child:Text(option_d.toString(),style: TextStyle(
                                        fontSize: 24
                                    ),)
                                    ,
                                  )
                              ),
                            )
                            ),
                          ],
                        ),


                        if(flag==false)
                          ElevatedButton(onPressed: StartTimer, child: Text(
                            'Start',style: TextStyle(
                              fontSize: 24
                          ),
                          ))
                        else
                          ElevatedButton(onPressed: Reset, child:  Text(
                            'Restart',style: TextStyle(
                              fontSize: 24
                          ),
                          )),




                        Text('Score:  '+score.toString()+'/$tapped',style: TextStyle(
                            fontSize: 24
                        ),),

                      ]),
                  // This trailing comma makes auto-formatting nicer for build methods.
                ),

            )
        )
        ,
      )

    );
  }
}
