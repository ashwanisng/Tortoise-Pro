import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/utils/theme/app_colors.dart';
import 'package:flutter_bloc_starter/utils/theme/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceDetailView extends StatefulWidget {
  const DeviceDetailView({super.key});

  @override
  State<DeviceDetailView> createState() => _DeviceDetailViewState();
}

class _DeviceDetailViewState extends State<DeviceDetailView> {
  final PageController _pageController = PageController();
  int _page = 0;
  int _selectedColorIndex = 0;
  String _selectedStorage = '128 GB';
  bool _promoExpanded = false;

  final List<Color> _colors = [
    AppColors.orange,
    AppColors.silver,
    AppColors.darkBlue,
  ];
  final List<String> _storages = ['128 GB', '256 GB', '512 GB', '1 TB'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF0F0F0),
            child: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.black87),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),
        ),
        title: Text(
          'iPhone 17 Pro',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        actions: const [SizedBox(width: 48)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _shippingBanner(),
              _imageCarousel(context),
              _protectedBanner(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('FINISH', style: Styles.tsSemiBold12),
                    const SizedBox(height: 8),
                    Text('Pick a color', style: Styles.tsMedium16),
                    const SizedBox(height: 12),
                    _colorPicker(),
                    const SizedBox(height: 36),
                    Text('STORAGE', style: Styles.tsSemiBold12),
                    const SizedBox(height: 8),
                    Text(
                      'How much space do you need?',
                      style: Styles.tsMedium16,
                    ),
                    const SizedBox(height: 20),
                    _storageOptions(),
                    const SizedBox(height: 36),
                    Text('SPECIFICATIONS', style: Styles.tsSemiBold12),
                    const SizedBox(height: 16),
                    _specCard(context),
                    const SizedBox(height: 32),
                    _promoCard(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomBar(),

    );
  }

  Widget _shippingBanner() {
    return Container(
      color: AppColors.lightBrown,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_shipping_outlined,
            size: 18,
            color: AppColors.yellow09,
          ),
          const SizedBox(width: 10),
          Text('Shipping will begin in 3-4 weeks', style: Styles.tsMedium13),
        ],
      ),
    );
  }

  Widget _imageCarousel(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.pink,
          height: MediaQuery.of(context).size.height * 0.42,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 0,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: Image.asset(
                          'assets/images/iphone_back.png',
                          fit: BoxFit.contain,
                          height: 260,
                        ),
                      ),

                      const SizedBox(height: 8),
                      Center(
                        child: ExactCarouselIndicator(
                          count: 3,
                          currentIndex: _page,
                          width: 88,
                          height: 22,
                          dotSize: 8,
                          dotSpacing: 10,
                          backgroundColor: const Color(0xFFDDDDDD),
                          inactiveDotColor: const Color(0xFFF1F1F1),
                          activeDotColor: const Color(0xFFE6E6E6),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _protectedBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(color: AppColors.darkGreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/shield.svg", height: 29, width: 26),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              'Protected with Tortoise Corporate Care',
              style: Styles.tsMedium14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorPicker() {
    return Row(
      children: List.generate(
        _colors.length,
        (i) => GestureDetector(
          onTap: () => setState(() => _selectedColorIndex = i),
          child: Container(
            margin: EdgeInsets.only(right: i == _colors.length - 1 ? 0 : 12),
            child: _buildColorDot(_colors[i], i == _selectedColorIndex),
          ),
        ),
      ),
    );
  }

  Widget _buildColorDot(Color color, bool selected) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? AppColors.green08 : Colors.transparent,
          width: selected ? 3 : 1,
        ),
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: CircleAvatar(backgroundColor: color, radius: 16),
    );
  }

  Widget _storageOptions() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          _storages.map((s) {
            final bool selected = _selectedStorage == s;
            return GestureDetector(
              onTap: () => setState(() => _selectedStorage = s),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: selected ? Colors.white : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selected ? AppColors.green08 : AppColors.grey,
                    width: selected ? 2 : 1,
                  ),
                  boxShadow:
                      selected
                          ? [
                            BoxShadow(
                              color: AppColors.green08.withOpacity(0.06),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ]
                          : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selected ? AppColors.green08 : AppColors.grey,
                          width: selected ? 6 : 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(s, style: Styles.tsSemiBold14),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _specCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.grey),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _specRow("assets/images/fullscreen.svg", 'Screen size', '6.3 inches'),
          const SizedBox(height: 16),
          _specRow("assets/images/Camera.svg", 'Camera', 'Rear facing: 48 MP'),
          const SizedBox(height: 16),
          _specRow(
            "assets/images/storage.svg",
            'Storage and RAM',
            '8 GB | 512 GB',
          ),
          const SizedBox(height: 16),
          _specRow(
            "assets/images/battery.svg",
            'Battery',
            'Up to 27 hours video playback',
          ),
          const SizedBox(height: 16),
          _specRow("assets/images/CellSignalFull.svg", 'Connectivity', '5G'),
          const SizedBox(height: 16),
          const Divider(height: 1, thickness: 1, color: AppColors.black03),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('More details', style: Styles.tsSemiBold13),
              const Spacer(),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.darkGreen1,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.expand_more,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _specRow(String iconPath, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconPath,
          height: 20,
          width: 20,
          color: AppColors.black,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.tsSemiBold14.copyWith(color: AppColors.black07),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Styles.tsMedium12.copyWith(color: AppColors.black07),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _promoExpandedView() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Image.asset(
            'assets/images/full_promo.png',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => _promoExpanded = false),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Text('View less', style: Styles.tsSemiBold13),
                const Spacer(),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.darkGreen1,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.expand_less,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _promoCollapsed() {
    return Column(
      children: [
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Container(
            height: 300,
            width: double.infinity,
            color: AppColors.white,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/half_promo.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => setState(() => _promoExpanded = true),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Text('View more', style: Styles.tsSemiBold13),
                const Spacer(),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.darkGreen1,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.expand_more,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _promoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AnimatedCrossFade(
        firstChild: _promoCollapsed(),
        secondChild: _promoExpandedView(),
        crossFadeState:
            _promoExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 320),
        firstCurve: Curves.easeOut,
        secondCurve: Curves.easeIn,
      ),
    );
  }

  Widget _bottomBar() {
    return SafeArea(
      top: false,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.green09, width: 1.5),
              ),
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DEVICE PRICE',
                          style: Styles.tsSemiBold12.copyWith(
                            color: AppColors.black2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('\u20B9 1,38,963', style: Styles.tsSemiBold18),
                        const SizedBox(height: 6),
                        Text(
                          'Monthly deduction \u20B918,900',
                          style: Styles.tsSemiBold12.copyWith(
                            color: AppColors.greyLight,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(width: 1, height: 110, color: AppColors.grey),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EFFECTIVE PRICE',
                            style: Styles.tsSemiBold12.copyWith(
                              color: AppColors.darkGreen1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\u20B9 92,483',
                            style: Styles.tsSemiBold18.copyWith(
                              color: AppColors.darkGreen1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                'Impact in net-salary',
                                style: Styles.tsSemiBold12.copyWith(
                                  color: AppColors.darkGreen1,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreen1,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 11),
            InkWell(
              onTap: () {
                // Handle add to cart action
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(vertical: 14),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.black2,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Add to cart',
                    style: Styles.tsSemiBold14.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExactCarouselIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final double width;
  final double height;
  final double dotSize;
  final double dotSpacing;
  final Color backgroundColor;
  final Color inactiveDotColor;
  final Color activeDotColor;
  final Duration animationDuration;

  const ExactCarouselIndicator({
    Key? key,
    this.count = 3,
    required this.currentIndex,
    this.width = 74,
    this.height = 20,
    this.dotSize = 8,
    this.dotSpacing = 10,
    this.backgroundColor = const Color(0xFFDDDDDD),
    this.inactiveDotColor = const Color(0xFFF1F1F1),
    this.activeDotColor = const Color(0xFFE6E6E6),
    this.animationDuration = const Duration(milliseconds: 220),
  }) : assert(count > 0),
       assert(currentIndex >= 0 && currentIndex < count),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(count, (i) {
            final bool isActive = i == currentIndex;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: dotSpacing / 2),
              child: AnimatedContainer(
                duration: animationDuration,
                width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: isActive ? activeDotColor : inactiveDotColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
