import '../../utils/utils.dart';
import '../../data/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.product.image,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // RATING
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFFF6700),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${widget.product.rating}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "(${widget.product.reviews})",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // NAME
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // PRICE + CART
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.price,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFFF6700),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFFF6700),
                            size: 19,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductLayout(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // LIKE BUTTON
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: Icon(
              likedItems.any((l) => l.item == widget.product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Color(0xFFFF6700),
            ),
            onPressed: () {
              setState(() {
                if (likedItems.any((l) => l.item == widget.product)) {
                  likedItems.removeWhere((l) => l.item == widget.product);
                } else {
                  likedItems.add(
                    SavedItem(type: SavedType.product, item: widget.product),
                  );
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
