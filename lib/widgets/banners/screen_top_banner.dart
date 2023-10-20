part of '../widgets.g.dart';

class ScreenTopBanner extends StatelessWidget {
  final Widget child;
  final String? assets;
  final Widget? image;
  final double? width;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const ScreenTopBanner({
    super.key,
    this.assets,
    required this.child,
    this.image,
    this.width,
    this.margin = const EdgeInsets.fromLTRB(10, 15, 10, 0),
    this.padding = const EdgeInsets.fromLTRB(25, 20, 10, 20),
  }) : assert(
          (assets != null && image == null && width != null) || (assets == null && image != null) || (assets == null && image == null),
          'You should provide one of the following options:\n'
          '- assets and width (for images loaded from assets)\n'
          '- image (for custom images)\n'
          'But you should not provide both assets and image or neither.',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xff0029BA),
        image: const DecorationImage(
          image: AssetImage('assets/images/card-decoration.png'),
          fit: BoxFit.contain,
          alignment: Alignment(1, -1),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          image != null
              ? image!
              : (isSvgImage(assets!)
                  ? SvgPicture.asset(
                      assets!,
                      width: width,
                    )
                  : Image.asset(assets!, width: width)),
        ],
      ),
    );
  }
}
