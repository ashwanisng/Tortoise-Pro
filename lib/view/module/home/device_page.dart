import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/utils/theme/app_colors.dart';
import 'package:flutter_bloc_starter/utils/theme/styles.dart';
import 'package:flutter_bloc_starter/view/module/device_detail/device_detail_view.dart';
import 'package:flutter_bloc_starter/view/module/home/widget/search_bar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  final TextEditingController _controller = TextEditingController(
    text: "Apple",
  );
  String selectedBrand = 'Apple';

  final List<Map<String, String>> brands = [
    {'name': 'Apple', 'iconPath': 'assets/images/apple_logo.svg'},
    {'name': 'Google', 'iconPath': 'assets/images/google_logo.svg'},
    {'name': 'Samsung', 'iconPath': 'assets/images/samsung_logo.svg'},
    {'name': 'OnePlus', 'iconPath': 'assets/images/oneplus_logo.svg'},
  ];

  final List<Map<String, String>> devices = [
    {'name': 'iPhone 16', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 16 Plus', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 16 Pro', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 16 Pro Max', 'img': 'assets/images/iphone16.png'},
    {'name': 'MacBook Pro', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPad Pro', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15 Plus', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15 Plus', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15 Plus', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15 Plus', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15 Plus', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15 Plus', 'img': 'assets/images/iphone16.png'},
    {'name': 'iPhone 15 Plus', 'img': 'assets/images/iphone16.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 24;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: SearchHeader(
        controller: _controller,
        onBack: () => Navigator.pop(context),
        onClear: () => setState(() {}),
        onSubmitted: (q) {},
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text('Search from popular brands', style: Styles.tsSemiBold16),
              const SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      brands.map((b) {
                        final bool isSelected = selectedBrand == b['name'];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap:
                                () =>
                                    setState(() => selectedBrand = b['name']!),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              height: 76,
                              width: 76,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? Colors.black
                                          : Colors.transparent,
                                  width: 2,
                                ),
                                boxShadow:
                                    isSelected
                                        ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.06,
                                            ),
                                            blurRadius: 8,
                                            offset: const Offset(0, 3),
                                          ),
                                        ]
                                        : [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.02,
                                            ),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    b['iconPath'] ?? "",
                                    height: 22,
                                    width: 22,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(b['name']!, style: Styles.tsMedium12),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(height: 18),

              Text('Available devices', style: Styles.tsSemiBold16),
              const SizedBox(height: 12),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 24, top: 6),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 120,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    return DeviceCard(
                      name: device['name']!,
                      imagePath: device['img']!,
                      onTap: () {
                        debugPrint('Navigate to detail: ${device['name']}');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeviceDetailView(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const DeviceCard({
    required this.name,
    required this.imagePath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Styles.tsMedium12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
