import 'package:flutter/material.dart';
import 'package:lahzadi/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          product.fields.name,
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.secondary.withOpacity(0.1),
              colorScheme.primary.withOpacity(0.05),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1.0,
              child: Card(
                elevation: 12,
                shadowColor: colorScheme.primary.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(product, colorScheme),
                      const SizedBox(height: 24),
                      _buildDetails(product, colorScheme),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ProductEntry product, ColorScheme colorScheme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.inventory_2_outlined,
            color: colorScheme.primary,
            size: 50,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          product.fields.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          height: 3,
          width: 100,
          decoration: BoxDecoration(
            color: colorScheme.secondary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(ProductEntry product, ColorScheme colorScheme) {
    return Column(
      children: [
        _buildDetailRow(
          icon: Icons.price_check_outlined,
          label: "Harga Produk",
          value: "Rp ${product.fields.price}",
          color: colorScheme.secondary,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 20),
        _buildDetailRow(
          icon: Icons.production_quantity_limits,
          label: "Jumlah Produk",
          value: "${product.fields.stock}",
          color: colorScheme.secondary,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 20),
        _buildDetailRow(
          icon: Icons.description_outlined,
          label: "Deskripsi Produk",
          value: product.fields.description,
          color: colorScheme.secondary,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 20),
        _buildDetailRow(
          icon: Icons.straighten_outlined,
          label: "Ukuran Produk",
          value: "${product.fields.size}",
          color: colorScheme.secondary,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
