
import 'package:flutter/material.dart';
import 'package:list/product.dart';
class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final TextEditingController _searchController = TextEditingController();

  int index = 0;

  List tableWidgets = [
    "",
    const Text('cart',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    const Text('profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
  ];

  List<Books> bookList = [
    Books('book1', 'Novels', 'price:150',true),
    Books('book2', 'Adu jeevitham', 'price:250',false),
    Books('book3', 'Benyamin', 'price:200',false),
    Books('book4', 'Janu', 'price:100',true),
    Books('book5', 'Mathilukal', 'price:300',true),
    Books('book6', 'Pathumayude Adu', 'price:300',false),
    Books('book07', 'Vijayapatham', 'price:200',false),
    Books('book08', 'Mittayi theruv', 'price:350',true),

  ];
List<String>item = [];
   @override
   void initState(){
     super.initState();
     item = item;
   }
   void itemsSearchedResults(String query){
     List<String> searchResults = item.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
     setState(() {
       item = searchResults;
     });
   }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Books',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
        ),
        backgroundColor:Colors.yellow[200],
        actions: [
      SizedBox(
        height:5 ,
        width:200,
        child: TextField(
          onChanged: (value) {itemsSearchedResults(value);},
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'search..',
            suffixIcon: IconButton(
                 icon: const Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
            ),
            prefixIcon: IconButton(
                icon: const Icon(Icons.search_rounded), onPressed: () {  },
            ),
            border: const OutlineInputBorder(),
            ),
          ),
      ),
        ],),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Text('Book',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('home'),
              onTap: () {
                setState(() {
                  index=0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart_outlined,
              ),
              title: const Text('cart'),
              onTap: () {
                setState(() {
                  index=1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('profile'),
              onTap: () {
                setState(() {
                  index=2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body:

          Center(
            child: index==0?home():tableWidgets[index],
          ),

      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels:true,
        type: BottomNavigationBarType.fixed,
        backgroundColor:Colors.yellow[200] ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "CART"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "PROFILE"),
        ],
        currentIndex: index,
        selectedItemColor: Colors.blue,
        unselectedItemColor:Colors.grey ,
        onTap: (int val){
          setState(() {
            index = val;
          }
          );
        },
      ),
    );
  }

  Widget getExpanded(String image,String mainText,String subText,bool visibility) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(
          left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
         Radius.circular(10),
        ),

        boxShadow: [
          BoxShadow(color: Colors.black),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: visibility,

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('-50%', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),



          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Product(image: image,
                mainText:mainText,
                subText: subText,
                offer:true,)));
            },
            child: Image.asset("assets/image/$image.jpeg", height: 100,
            ),
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            mainText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            subText,
            style: const TextStyle(
                fontSize: 10.0
            ),
          ),


        ],
      ),
    );
  }

  Widget home() {
    return Container(

    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
    height: MediaQuery.of(context).size.height,
    color: Colors.yellow[200],

    child: GridView.builder(
      itemCount: bookList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ), itemBuilder: (BuildContext context, int index)

    {
        return getExpanded(bookList[index].image,bookList[index].mainText,bookList[index].subText,bookList[index].offer);

    },

        ),


    /*Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget> [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              getExpanded('book1','Novel','price:150'),
        getExpanded('book2','adu jeevithm','price:250'),
      ],
    ),
  ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget> [

              getExpanded('book3','benyamin','price:100'),
              getExpanded('book4','janu','price:200'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget> [

              getExpanded('book5','mathilukal','price:150'),
              getExpanded('book3','benyamin','price:350'),
            ],
          ),
        ),

  ],
),*/

  );
}

}



class Books {
  String image;
  String mainText;
  String subText;
  bool offer;
  Books(this.image,this.mainText,this.subText,this.offer);
}