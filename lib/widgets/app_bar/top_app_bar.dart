part of '../widgets.g.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      //padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Padding(
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ThemeConsts.appPrimaryLightYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
