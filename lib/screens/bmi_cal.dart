import 'package:flutter/material.dart';

class BMI_Cal extends StatefulWidget {
  const BMI_Cal({super.key});

  @override
  State<BMI_Cal> createState() => _BMI_CalState();
}

class _BMI_CalState extends State<BMI_Cal> {

  int height = 150;
  int weight = 70;
  late double BMI = calculateBMI(height: height, weight: weight);

  double calculateBMI({required int height , required int weight}){
    return weight / (height*height) * 10000;
  }

   String getResult(bmiValue){
    if(bmiValue >= 25){
      return 'Overweight';
    }else if(bmiValue > 18.5){
      return "Normal";
    }else{
      return "Underweight";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 250,
                      width: 175,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent.withAlpha(90),
                        borderRadius: BorderRadius.circular(25)
                      ),

                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.male , size: 150),
                          Text("male" , style: TextStyle(
                            fontSize: 30
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 250,
                      width: 175,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent.withAlpha(90),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.female , size: 150,),
                          Text("Female" , style: TextStyle(
                            fontSize: 30
                          ),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height" , style: TextStyle(
                            fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),),
                         Text(
                          "$height",
                          style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                            color: Colors.red
                        ),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(height < 220){height ++;}
                                BMI = calculateBMI(height: height, weight: weight);


                              });
                            },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                              ),
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add , size: 40,),),
                            SizedBox(width: 25,),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(height > 50){
                                  height --;
                                }
                                BMI = calculateBMI(height: height, weight: weight);
                              });
                            },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                              ),
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.remove , size: 40,),)
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight" , style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),),
                         Text("$weight", style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                        ),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(weight < 300){
                                  weight++;
                                }
                                BMI = calculateBMI(height: height, weight: weight);
                              });
                            },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                              ),
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add , size: 40,),),
                            SizedBox(width: 25,),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(weight > 20){
                                  weight --;
                                }
                                BMI = calculateBMI(height: height, weight: weight);
                              });
                            },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                              ),
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.remove , size: 40,),)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Column(
                children: [
                  Text("BMI"),
                   Text(BMI.toStringAsFixed(2), style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),
                  ),
                  Text(getResult(BMI)),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
