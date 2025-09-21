import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/utils/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHeader extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final VoidCallback? onBack;
  final VoidCallback? onClear;
  final ValueChanged<String>? onSubmitted;

  const SearchHeader({
    Key? key,
    required this.controller,
    this.onBack,
    this.onClear,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<SearchHeader> createState() => _SearchHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(96);
}

class _SearchHeaderState extends State<SearchHeader> {
  final FocusNode _focusNode = FocusNode();
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    _editing = false;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _startEditing() {
    setState(() => _editing = true);
    Future.delayed(Duration(milliseconds: 80), () {
      if (mounted) _focusNode.requestFocus();
    });
  }

  void _stopEditing() {
    setState(() => _editing = false);
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = Colors.black.withOpacity(0.06);
    final boxColor = Colors.white;
    final chipBg = AppColors.grey;
    final chipTextStyle = GoogleFonts.inter(fontSize: 14);
    final hintStyle = GoogleFonts.inter(color: Colors.grey.shade600);

    return SafeArea(
      bottom: false,
      child: Container(
        height: widget.preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        color: Colors.transparent,
        child: Row(
          children: [
            GestureDetector(
              onTap: widget.onBack ?? () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_left, color: Colors.grey),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor, width: 1.4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.black54),
                    const SizedBox(width: 10),

                    Expanded(
                      child:
                          _editing
                              ? TextField(
                                focusNode: _focusNode,
                                controller: widget.controller,
                                textInputAction: TextInputAction.search,
                                style: GoogleFonts.inter(fontSize: 15),
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: hintStyle,
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onSubmitted: (v) {
                                  widget.onSubmitted?.call(v);
                                  _stopEditing();
                                },
                              )
                              : GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  if ((widget.controller.text ?? '')
                                      .isNotEmpty) {
                                    _startEditing();
                                  } else {
                                    _startEditing();
                                  }
                                },
                                child: SizedBox(
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:
                                            (widget.controller.text ?? '')
                                                    .isNotEmpty
                                                ? _buildChip(
                                                  widget.controller.text,
                                                  chipBg,
                                                  chipTextStyle,
                                                )
                                                : Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Search',
                                                    style: hintStyle,
                                                  ),
                                                ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                    ),

                    const SizedBox(width: 6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String text, Color bg, TextStyle textStyle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: textStyle),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              widget.controller.clear();
              widget.onClear?.call();
              setState(() {});
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 12),
            ),
          ),
        ],
      ),
    );
  }
}
