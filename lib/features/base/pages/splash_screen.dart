import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/error_screen.dart';
import 'package:stackfood/features/base/bloc/app_meta_data_cubit/app_meta_data_cubit.dart';
import 'package:stackfood/features/home/presentation/home_screen/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 500))
        .then((_) => sl.get<AppMetaDataCubit>().init());
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AppMetaDataCubit, AppMetaDataState>(
        listener: (context, appMetaDataState) {
          switch (appMetaDataState) {
            case AppMetaDataInitial():
            case AppMetaDataLoading():
            case AppMetaDataLoaded():
              context.goNamed(HomeScreen.routeName);
            case AppMetaDataLoadingFailed():
              context.goNamed(ErrorScreen.routeName);
          }
        },
        builder: (context, appMetaDataState) {
          return const SplashWelcomeView();
        },
      );
}

class SplashWelcomeView extends StatelessWidget {
  const SplashWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: context.isDesktop
                      ? const BoxConstraints(maxWidth: 300, maxHeight: 300)
                      : const BoxConstraints(maxWidth: 200, maxHeight: 200),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.string(
                      prayStringSvg,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const CircularProgressIndicator.adaptive(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const prayStringSvg = '''
<svg width="1080" height="1080" viewBox="0 0 1080 1080" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M590.84 242.27H877.06C880.922 242.27 884.625 243.804 887.355 246.535C890.086 249.265 891.62 252.968 891.62 256.83V543C891.62 546.862 890.086 550.565 887.355 553.295C884.625 556.026 880.922 557.56 877.06 557.56H805.37C744.62 557.56 686.358 533.431 643.397 490.479C600.435 447.527 576.293 389.27 576.28 328.52V256.83C576.28 252.968 577.814 249.265 580.545 246.535C583.275 243.804 586.978 242.27 590.84 242.27Z" fill="#E5E5E5"/>
<path d="M270.444 736.1C275.627 720.148 266.897 703.015 250.945 697.832C234.993 692.649 217.86 701.378 212.677 717.33C207.494 733.282 216.224 750.416 232.176 755.599C248.128 760.782 265.261 752.052 270.444 736.1Z" fill="#E2E2E2"/>
<path d="M320.604 675.4C323.104 667.705 318.893 659.44 311.198 656.94C303.503 654.44 295.238 658.651 292.738 666.346C290.238 674.041 294.449 682.306 302.144 684.806C309.839 687.306 318.104 683.095 320.604 675.4Z" fill="#E2E2E2"/>
<path d="M220.94 658.42L182.76 630.24" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M235.32 647.7L228.22 634.87" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M250.88 643.74L254.21 605.75" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M391.35 766.91C443 684.73 495.94 512.78 505.11 412.34C505.282 404.783 508.398 397.591 513.794 392.298C519.191 387.004 526.441 384.027 534 384V384C541.665 384 549.016 387.045 554.435 392.465C559.855 397.884 562.9 405.235 562.9 412.9V714.26C552.9 758.54 534.99 800.12 477.08 801.67L453.67 840.88" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M507.52 656.43V558.58C507.52 551.236 510.437 544.193 515.63 539C520.823 533.807 527.866 530.89 535.21 530.89C538.846 530.89 542.447 531.606 545.807 532.998C549.166 534.389 552.219 536.429 554.79 539C557.361 541.572 559.401 544.624 560.792 547.984C562.184 551.343 562.9 554.944 562.9 558.58V656.42" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M370.77 769.02L463.36 878.91L434.95 912.74L337.49 797.06L370.77 769.02Z" fill="#E5E5E5"/>
<path d="M370.77 742.49L463.36 852.38L434.95 886.21L337.49 770.53L370.77 742.49Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M733.95 766.91C682.33 684.73 629.36 512.78 620.19 412.33C620.015 404.773 616.897 397.582 611.499 392.291C606.1 386.999 598.849 384.024 591.29 384V384C583.625 384 576.274 387.045 570.855 392.465C565.435 397.884 562.39 405.235 562.39 412.9V714.26C572.39 758.54 590.3 800.12 648.21 801.67L671.62 840.88" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M617.77 656.43V558.58C617.77 551.236 614.853 544.193 609.66 539C604.467 533.807 597.424 530.89 590.08 530.89V530.89C586.444 530.89 582.843 531.606 579.484 532.998C576.124 534.389 573.071 536.429 570.5 539C567.929 541.572 565.889 544.624 564.498 547.984C563.106 551.343 562.39 554.944 562.39 558.58V656.42" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M754.53 767.49L661.93 877.38L690.35 911.21L787.81 795.53L754.53 767.49Z" fill="#E5E5E5"/>
<path d="M754.53 742.49L661.93 852.38L690.35 886.21L787.81 770.53L754.53 742.49Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M524.65 350.05L462.06 269.05" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M561.06 345.64V182.05" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M597.05 345.64L662.72 279.97" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';
