import '../../data/dummy/product.dart';
import '../../utils/utils.dart';

class ProductLayout extends StatefulWidget {
  const ProductLayout({super.key});

  @override
  State<ProductLayout> createState() => _ProductLayoutState();
}

class _ProductLayoutState extends State<ProductLayout> {
  final ScrollController _scrollController = ScrollController();
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Hardcoded static product
    final product = Product(
      id: 1,
      name: 'Static Product',
      description: 'This is a description of a static product.',
      price: 1500.0,

      imageUrl: 'assets/images/candles.png',
      category: 'Electronics',
      rating: 4.5,

      availableColors: [Colors.red, Colors.blue, Colors.green],
    );

    final double imageHeight = MediaQuery.of(context).size.height * 0.45;
    final double translateY = (-scrollOffset * 0.3).clamp(-80, 0);
    final double scale = (1 - scrollOffset / 800).clamp(0.9, 1.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ======== IMAGE ========
          Transform.translate(
            offset: Offset(0, translateY),
            child: Transform.scale(
              scale: scale,
              child: Image.asset(
                product.imageUrl,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ======== SCROLLABLE CONTENT ========
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: imageHeight - 30),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Descriptiontext(
                        descriptionTitle: product.name,
                        descriptionParag: product.description,
                      ),
                      const SizedBox(height: 20),
                      Colorschangingrow(colors: product.availableColors),
                      const SizedBox(height: 30),

                      // ======== INFO CONTAINERS ========
                      Productinfocontainer(
                        infotitle: 'Category',
                        information: product.category,
                      ),
                      Productinfocontainer(
                        infotitle: 'Price (DA)',
                        information: product.price.toStringAsFixed(0),
                      ),
                      Productinfocontainer(
                        infotitle: 'ID',
                        information: product.id.toString(),
                      ),

                      const SizedBox(height: 40),
                      Priceandbuy(price: product.price, productdesc: 'Price'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ======== BACK BUTTON ========
          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.4),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: ProductLayout(),
//     ),
//   );
// }
