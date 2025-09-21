import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/utils/theme/app_colors.dart';
import 'package:flutter_bloc_starter/utils/theme/styles.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class EffectivePriceDialog extends StatefulWidget {
  final String effectivePrice;
  final String impactMonthly;

  const EffectivePriceDialog({
    super.key,
    required this.effectivePrice,
    required this.impactMonthly,
  });

  @override
  State<EffectivePriceDialog> createState() => _EffectivePriceDialogState();
}

class _EffectivePriceDialogState extends State<EffectivePriceDialog> {
  final List<String> _taxOptions = ['0%', '10%', '20%', '30%'];
  String _selectedTax = '30%';
  bool _expandedKnowMore = false;

  @override
  Widget build(BuildContext context) {
    final maxWidth = 560.0;
    final dialogWidth = MediaQuery.of(context).size.width.clamp(0, maxWidth);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth.toDouble(),
        ),
        child: Material(
          color: Colors.white,
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          clipBehavior: Clip.hardEdge,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EFFECTIVE PRICE',
                    style: Styles.tsSemiBold12.copyWith(
                      color: AppColors.greyLight,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "The effective price is the device’s cost after savings, based on your payroll structure",
                    textAlign: TextAlign.center,
                    style: Styles.tsMedium14.copyWith(color: AppColors.black09),
                  ),

                  const SizedBox(height: 18),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14.0,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Tax slab',
                                  style: Styles.tsMedium14.copyWith(
                                    color: AppColors.black2,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: _showTaxPicker,
                                borderRadius: BorderRadius.circular(8),
                                child: Row(
                                  children: [
                                    Text(
                                      _selectedTax,
                                      style: Styles.tsSemiBold14.copyWith(
                                        color: AppColors.black09,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 22,
                                      color: AppColors.black09,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(
                            color: AppColors.grey,
                            thickness: 1,
                            height: 0,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Effective price of the device',
                                      style: Styles.tsSemiBold14.copyWith(
                                        color: AppColors.green08,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Price calculation based on selected tax slab',
                                      style: Styles.tsMedium12.copyWith(
                                        color: AppColors.black2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                widget.effectivePrice,
                                style: Styles.tsSemiBold14.copyWith(
                                  color: AppColors.green08,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                            height: 0,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Impact in monthly in-hand',
                                      style: Styles.tsMedium14.copyWith(
                                        color: AppColors.black2,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Your monthly in-hand salary will be reduced by this amount',
                                      style: Styles.tsMedium12.copyWith(
                                        color: AppColors.black2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                widget.impactMonthly,
                                style: Styles.tsSemiBold14.copyWith(
                                  color: AppColors.black09,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                            height: 0,
                          ),
                        ),

                        InkWell(
                          onTap:
                              () => setState(
                                () => _expandedKnowMore = !_expandedKnowMore,
                              ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
                            child: Row(
                              children: [
                                Text(
                                  'Know more',
                                  style: Styles.tsMedium12.copyWith(
                                    color: AppColors.darkGreen1,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _expandedKnowMore
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    color: AppColors.darkGreen1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (_expandedKnowMore)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
                            child: Text(
                              'More details about effective price calculation can go here. You may show step-by-step breakdown or assumptions used in the calculation.',
                              style: Styles.tsMedium12.copyWith(
                                color: AppColors.black2,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
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
                          'Okay! Understood',
                          style: Styles.tsSemiBold14.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showTaxPicker() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      builder: (ctx) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemBuilder: (c, i) {
            final t = _taxOptions[i];
            return ListTile(
              title: Text(
                t,
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
              onTap: () => Navigator.of(ctx).pop(t),
            );
          },
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemCount: _taxOptions.length,
        );
      },
    );

    if (selected != null && mounted) {
      setState(() => _selectedTax = selected);
    }
  }
}
