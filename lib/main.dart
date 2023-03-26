import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // static const String _title = ';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: Scaffold(
        appBar: AppBar(  centerTitle: true,title: Text('Trenching Safety App'),backgroundColor: Colors.red.shade300 ),
        body: const MyStatefulWidget(),


        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20) );

    return Center(

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[





          SizedBox(height: 50),
          Center(

            child:ElevatedButton.icon(



              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },

              icon:Icon((Icons.calculate_outlined),color: Colors.black,size: 50.0, ),

              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200,fixedSize: const Size(300, 100)),
              label: const Text('Safety Factor Calculator',textAlign: TextAlign.center ,style: TextStyle(fontSize: 15, color: Colors.black)),
            ),
          ),



          SizedBox(height: 50 ),
          Center(
            child:ElevatedButton.icon(
              onPressed: () {},
              icon:Icon(Icons.science_outlined,color: Colors.black,size: 50.0 ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200,fixedSize: const Size(300, 100)),
              label:const Text('Toxic Gas and Chemical dentification',textAlign: TextAlign.center ,style: TextStyle(fontSize: 15, color: Colors.black)),
            ),),





          SizedBox(height: 50 ),
          Center(
              child:ElevatedButton.icon(

                onPressed: () {},

                icon:Icon(Icons.trending_down_rounded,color: Colors.black,size: 50.0 ),

                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200,fixedSize: const Size(300, 100)),


                label: const Text(' Soil Decontamination and Stabilization',textAlign: TextAlign.center ,style: TextStyle(fontSize: 15, color: Colors.black)),
              )),
        ],
      ),
    );
  }
}




class SecondRoute extends StatefulWidget{

  const SecondRoute({Key?key}):super(key: key);

  @override
  State<SecondRoute> createState()=> _MyHomePageState();

}

class _MyHomePageState extends State<SecondRoute>{

  var ftController =TextEditingController();
  var pstController =TextEditingController();
  var pcfController=TextEditingController();


  var result ="";



  @override
  Widget build (BuildContext context){

    return Scaffold(
        appBar: AppBar(
          // title: Text("Trench Safety"),
        ),


        body:Container(
            color: Colors.grey.shade200,
            child:Center(
                child:Container(

                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('Trench Factor of Safety Calculator',style:TextStyle(
                            fontSize: 34,fontWeight: FontWeight.w500
                        ),),

                        SizedBox(height:21,),

                        TextField(
                          controller: ftController,
                          decoration: InputDecoration(
                            label:Text('Enter Depth in ft'),
                            prefixIcon: Icon(Icons.line_weight),
                          ),

                        ),
                        SizedBox(height:11,),
                        TextField(
                          controller: pstController,
                          decoration: InputDecoration(label:Text('Enter Shear Strength in Psf'),
                            prefixIcon: Icon(Icons.line_weight),
                          ),


                          // keyboardType: TextInputType.number,

                        ),

                        SizedBox(height:11,),

                        TextField(
                          controller: pcfController,
                          decoration: InputDecoration(label:Text('Enter Soil Unit Weight in Pcf'),
                            prefixIcon: Icon(Icons.line_weight),
                          ),
                        ),

                        SizedBox(height:16,),

                        ElevatedButton(onPressed: (){



                          var ft = ftController.text.toString();
                          var psf=pstController.text.toString();
                          var pcf=pcfController.text.toString();

                          if (ft!="" && psf!="" && pcf!=""){

                            //Safety calculation


                            //  var cohension =double.parse(ft );

                            var cohension =double.parse(ft);
                            var depth =double.parse(psf);
                            var weight=double.parse(pcf);



                            var plane =(4*cohension)/(depth*weight);
                            var surface=(3.83 *cohension)/(depth*weight);






                            setState(() {



                              result ="Planar Failure Factor of Safety:${plane.toStringAsFixed(3) }\n "+
                                  "Cirular Failure Factor of Safety: ${surface.toStringAsFixed(3)}" ;

                            });



                          }else{

                            setState(() {

                              result = "Please fill all the required blanks";

                            });

                          }


                        }, child: Text('Calculate')),

                        SizedBox(height: 15,),

                        Text(result , style:TextStyle(fontSize: 19),)

                      ],
                    )
                )
            )
        )
    );

  }
}

                            setState(() {



                              result ="Planar Failure Factor of Safety:${plane.toStringAsFixed(3) }\n \n" +
                                  "Cirular Failure Factor of Safety: ${surface.toStringAsFixed(3)}" ;

                            });



                          }else{

                            setState(() {

                              result = "Please fill all the required blanks";

                            });

                          }


                        }, child: Text('Calculate')),

                        SizedBox(height: 15,),

                        Text(result , style:TextStyle(fontSize: 19),)

                      ],
                    )
                )
            )
        )
    );

  }
}