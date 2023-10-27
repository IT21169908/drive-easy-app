part of '../widgets.g.dart';

class ScreenTopBanner extends StatelessWidget {
  final Widget title;
  final String? assets;
  final Widget? image;
  final double? imageWidth;
  final EdgeInsets bannerMargin;
  final EdgeInsets titlePadding;
  final bool? isNormalPage;

  const ScreenTopBanner({
    super.key,
    this.assets,
    required this.title,
    this.image,
    this.imageWidth,
    this.bannerMargin = EdgeInsets.zero,
    this.titlePadding = const EdgeInsets.fromLTRB(25, 20, 10, 20),
    this.isNormalPage = false,
  }) : assert(
          (assets != null && image == null && imageWidth != null) || (assets == null && image != null) || (assets == null && image == null),
          'You should provide one of the following options:\n'
          '- assets and width (for images loaded from assets)\n'
          '- image (for custom images)\n'
          'But you should not provide both assets and image or neither.',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isNormalPage! ? 100 : null,
      margin: bannerMargin,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: titlePadding,
                child: title,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: image != null
                    ? image!
                    : (isSvgImage(assets!)
                        ? SvgPicture.asset(
                            assets!,
                            width: imageWidth,
                          )
                        : Image.asset(assets!, width: imageWidth)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
