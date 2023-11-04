import 'package:flutter/material.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/extenstions/navigator.dart';
import 'package:shopingpriject/wedgets/discount.dart';
import 'package:shopingpriject/wedgets/free_delivery.dart';
import 'package:shopingpriject/wedgets/item_total.dart';
import 'package:shopingpriject/wedgets/order_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
   calculateGlobalPrice();
    return Scaffold(body: Column(children: [
      SizedBox(height: 50,),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          InkWell(onTap: () {
            context.popScreen();
          },
            child: Icon(Icons.arrow_back_ios)),
          Text("My Orders",style: TextStyle(fontSize: 20),),
          Icon(Icons.exit_to_app_outlined)
        ],),
      ),
SizedBox(
  width: 389,height: 400,
  child:   ListView.separated(
  
                        shrinkWrap: true,
  
                       
  
                        itemBuilder: (context, index) {
  
                          return InkWell(
  
                            onLongPress: () {
  
                              orderProuct[index].count = 0;
  
                              globalPrice = globalPrice -
  
                                  (double.parse(orderProuct[index].price) *
  
                                      orderProuct[index].count!);
  
                              orderProuct.remove(orderProuct[index]);
  
  
  
                              setState(() {});
  
                            },
  
                            child: OrderCard(
  
                              product: orderProuct[index],
  
                            ),
  
                          );
  
                        },
  
                        separatorBuilder: (context, index) => SizedBox(height: 9,),
  
                        itemCount: orderProuct.length),
),
                      Divider(thickness: 2,),
                      Column(children: [
                        Total(),
                        Discount(),
                        FreeDelivery(),

                        
                      ],),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment. spaceEvenly,
                        children: [
                        Text("Grand Total",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        SizedBox(width: 150,),
                        Text("\$${(globalPrice-globalPrice/22).toStringAsFixed(2)}",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold ),)
                      ],),
                      Container(width: 360,height: 55,decoration: BoxDecoration(borderRadius: BorderRadius.circular(26), color: Color(0xfffcc874)),child: Center(child: Text("Checkout",style: TextStyle(fontSize: 18),)),)
                      
    ],),);
  }

  

}