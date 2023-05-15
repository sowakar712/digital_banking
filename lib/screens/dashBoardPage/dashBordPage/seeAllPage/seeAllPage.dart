import 'package:digital_banking/screens/dashBoardPage/dashBordPage/dashBoardPage.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/seeAllPage/sampleTransationPage.dart';
import 'package:digital_banking/wedget/textWedget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class SeeAllPage extends StatefulWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Container(
            margin: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              boxShadow : [BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                  offset: Offset(0,-2),
                  blurRadius: 15
              )],
              color:Color(0xFFFF2F2F2),
            ),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              InkWell(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset("assets/icon/Rectangle.png")
                  ],
                ),
                onTap: (){
                  Get.off(
                    DashBoardPage(),
                    duration: Duration(milliseconds: 1000),
                    transition: Transition.downToUp,
                  );
                },
              ),
              ListTile(
                leading: text(
                  text: "Today",
                  color: Color(0xFFF301044),
                  fontWeight: FontWeight.bold,
                  size: 24
                ),
                trailing:Wrap(
                  children: [
                    TextButton(onPressed: (){}, child:Image.asset("assets/icon/out.png")),
                    IconButton(onPressed: (){}, icon:Icon(Icons.search,size:36,))
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    onTap: (){
                      Get.off(SimpleTransactionPage());
                    },
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/cart.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    height: 2,
                    color: Color(0xFFFD9D9D9),
                    thickness: 2,
                  ),
                  ListTile(
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/camera.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    height: 2,
                    color: Color(0xFFFD9D9D9),
                    thickness: 2,
                  ),
                  ListTile(
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/cart.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    height: 2,
                    color: Color(0xFFFD9D9D9),
                    thickness: 2,
                  ),
                  ListTile(
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/camera.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                ],
              ),
              const Divider(
                endIndent: 10,
                indent: 10,
                height: 2,
                color: Color(0xFFFD9D9D9),
                thickness: 2,
              ),
              Container(
                height: 123,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.all(Radius.circular(15)),
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: image.length,
                    itemBuilder: (context,index){
                      return   Container(
                          width: 103,
                          height: 123,
                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                        width: 103,
                                        height: 123,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.all(Radius.circular(15)),
                                          image : DecorationImage(
                                              image: NetworkImage(image[index]),
                                              fit: BoxFit.fill
                                          ),
                                        )
                                    )
                                ),Positioned(
                                    top: 78,
                                    left: 7,
                                    child: text(
                                        text: "Community\nInvestment",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        size: 14
                                    )
                                ),
                              ]
                          )
                      );
                    }
                ),
              ),
               ListTile(
                 title: text(
                     text: "16 March,2021",
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                     size: 24
                 ),
               ),
              Column(
                children: [
                  ListTile(
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/cart.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    height: 2,
                    color: Color(0xFFFD9D9D9),
                    thickness: 2,
                  ),
                  ListTile(
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/camera.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    height: 2,
                    color: Color(0xFFFD9D9D9),
                    thickness: 2,
                  ),
                  ListTile(
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/cart.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    height: 2,
                    color: Color(0xFFFD9D9D9),
                    thickness: 2,
                  ),
                  ListTile(
                      leading:const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage:AssetImage("assets/screen/cart.png"),
                      ),
                      title: Text("Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                      subtitle:Text("Resturant & CafeStarbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,))),
                      trailing:Column(
                        children: [
                          Text("- £ 150.00 Starbucks",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:16,fontWeight: FontWeight.bold,))),
                          Text("Visa infinite DC ",style:GoogleFonts.quicksand(textStyle:const TextStyle(fontSize:13,fontWeight: FontWeight.bold,color:Colors.grey))),
                        ],
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  List image=[
    "https://thumbs.dreamstime.com/z/making-cash-payment-5494712.jpg",
    "https://c8.alamy.com/comp/FC7XAY/hispanic-woman-holding-cash-and-credit-card-FC7XAY.jpg",
    "https://www.rd.com/wp-content/uploads/2018/07/feel-better_reasons-to-pay-cash.jpg",
    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2022/03/14/1047885-cash-money.jpg",
    "https://thumbs.dreamstime.com/z/making-cash-payment-5494712.jpg",
    "https://c8.alamy.com/comp/FC7XAY/hispanic-woman-holding-cash-and-credit-card-FC7XAY.jpg",
    "https://www.rd.com/wp-content/uploads/2018/07/feel-better_reasons-to-pay-cash.jpg",
    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2022/03/14/1047885-cash-money.jpg"
  ];
}
