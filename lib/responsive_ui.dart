import 'package:flutter/material.dart';

class ResponsiveProductLayout extends StatelessWidget {
  final List<Widget> products;

  const ResponsiveProductLayout({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns;

        if (constraints.maxWidth < 600) {
          columns = 2;
        } else if (constraints.maxWidth < 900) {
          columns = 3;
        } else {
          columns = 4;
        }

        return GridView.count(
          crossAxisCount: columns,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
          children: products,
        );
      },
    );
  }
}