import 'package:flutter/material.dart';
class  Product extends StatelessWidget {
  final String image;
  final String mainText;
  final String subText;
  final bool offer;
  Product({super.key, required this.image, required this.mainText, required this.subText, required this.offer});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.yellow[200],
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: [
             Image.asset("assets/image/$image.jpeg",height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width,fit: BoxFit.cover,
            ),
              Image.asset("assets/image/$image.jpeg",height: MediaQuery.of(context).size.height/1.5,
                width: MediaQuery.of(context).size.width,fit: BoxFit.cover,
              ),
              Image.asset("assets/image/$image.jpeg",height: MediaQuery.of(context).size.height/1.5,
                width: MediaQuery.of(context).size.width,fit: BoxFit.cover,
              ),


      ],
          ),
          IconButton(
            padding: const EdgeInsets.only(left: 20,top: 40,),
            icon:const Icon(Icons.close,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height/2.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.yellow[200],
              borderRadius: const BorderRadius.only(topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
              ),
              ),
              child: Column(
                children: [
                  Expanded(
                      child:SingleChildScrollView(
                        padding: const EdgeInsets.all(30),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(mainText,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                  Text(subText,style: const TextStyle(fontSize: 20,backgroundColor:Colors.redAccent),
                                  ),
                                ],
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start ,
                                  children: const [
                                    Text("Details"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("This novel make very beautiful story."),
                                  ],
                                ))
                              ],
                              
                            )
                              
                            
                          ],
                        ) ,
                      )
                  ),
                  Container(
                    height: 50,
                    width:MediaQuery.of(context).size.width,color: Colors.yellow[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black87),
                          shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.favorite),
                        ),

                        TextButton(
                            onPressed: (){ },
                          style: TextButton.styleFrom(
                            primary: Colors.black87,
                            backgroundColor: Colors.red[400],
                            shape: const StadiumBorder(),padding: EdgeInsets.symmetric(
                              horizontal:MediaQuery.of(context).size.width/4),

                              ),
                             child: const Text("Go to cart",),
                        ),

                      ],
                    ),

                  )
                ],

              ),
            ),
          ),
        ],
      ),

      );


  }
}
