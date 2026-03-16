import 'package:flutter/material.dart';
import 'package:katalog_app/model/product_model.dart';

class CardScreen extends StatefulWidget {
  final List<Data> products;
  final Set<int> cardIds;

  const CardScreen({super.key, required this.products , required this.cardIds});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final cardProducts = widget.products
    .where((product) => widget.cardIds.contains(product.id))
    .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.white,
        leadingWidth: 20,
      ),
      body: SafeArea(child: 
      Padding(padding: EdgeInsets.all(16),
       child: Column(children: [
        Expanded(
          child: cardProducts.isEmpty 

          ? Center(child:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_cart_checkout_outlined,
               size: 64,
                color: Colors.grey,
                ),
                SizedBox(height: 12),

                Text("Your card is empty.", style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,

                ),
                
                ),

                SizedBox(height: 12),

                Text("Add items to start shopping.", 
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,

                ),
                )

            ],
          ),)
          :
          
          ListView.builder(
          itemCount: cardProducts.length,
          itemBuilder: (context, index ) {
            final item = cardProducts[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row (children: [
                   Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        item.image ?? "",
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),

                SizedBox(width: 16),
                Expanded(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name ?? "" , 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      Text(item.tagline ?? ""),
                      Text(item.price ?? ""),
                  
                    ],
                  ),
                ),

                IconButton(onPressed: (){
                  setState(() {
                    widget.cardIds.remove(item.id);
                  });
                }, icon: Icon(Icons.remove_circle_outline),
                ),
              ],
              ),
            );
          }
          ),
         ),

         SizedBox(height: 20),
         
         Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.grey.shade600),


              SizedBox(width: 8),

              Text("Lorem impus Lorem Ipsum is simply dummy text",style: TextStyle(color: Colors.grey.shade600),)
            ],
            
          ),
         ),

         SizedBox(height: 10),


         ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
          child: Text(
          "Checkout",

          style: TextStyle(color: Colors.white),

         ),
         )

       ],
       ),
      ),
      ),

    );
  }
}