import 'package:carousel_slider/carousel_slider.dart';
import 'package:financial_literacy_game/config/color_palette.dart';
import 'package:financial_literacy_game/presentation/widgets/menu_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'cash_indicator.dart';
import 'next_period_button.dart';

class HowToPlayDialog extends ConsumerWidget {
  const HowToPlayDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuDialog(
      title: translate('How to play'),
      content: SizedBox(
        height: 300,
        width: 500, // max width of dialog
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.0,
            //viewportFraction: 0.8,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
          items: [
            HowToPlayCard(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  NextPeriodButton(isDemonstrationMode: true),
                  SizedBox(height: 20.0),
                  Text(
                    '1. ಆಟವನ್ನು ಪ್ರಾರಂಭಿಸಲು ಮೇಲಿನ ಬಲ ಮೂಲೆಯಲ್ಲಿರುವ "ಮುಂದೆ" ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ.',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const HowToPlayCard(
              content: Text(
                '2. ನೀವು ಹಣದಿಂದ ಪ್ರಾಣಿಯನ್ನು ಖರೀದಿಸಬಹುದು, ಸಾಲವನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು ಅಥವಾ ಆಸ್ತಿಯನ್ನು ಖರೀದಿಸದಿರಲು ನಿರ್ಧರಿಸಬಹುದು.',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            const HowToPlayCard(
              content: Text(
               "3. ಪ್ರತಿಯೊಂದು ಸುತ್ತಿನ ಪ್ರಾಣಿಗಳು ಬೆಲೆ, ಆದಾಯ ಮತ್ತು ಜೀವಿತಾವಧಿಯಲ್ಲಿ ಬದಲಾಗುತ್ತವೆ.",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            const HowToPlayCard(
              content: Text(
                '4. ಪ್ರಾಣಿ ಕಾರ್ಡ್‌ನ ಕೆಳಗಿನ ಲೆಕ್ಕಾಚಾರಗಳು ನಿಮಗೆ ಸಹಾಯಕವಾಗಬಹುದು.',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            HowToPlayCard(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ನಗದು ಗುರಿ: '
                    '${75.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: ColorPalette().darkText,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const CashIndicator(
                    currentCash: 75,
                    cashGoal: 100,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    '5. ಮುಂದಿನ ಹಂತಕ್ಕೆ ಹೋಗಲು ನೀವು ನಿರ್ದಿಷ್ಟ ನಗದು ಮೊತ್ತವನ್ನು ತಲುಪಬೇಕು.',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HowToPlayCard extends StatelessWidget {
  const HowToPlayCard({
    super.key,
    required this.content,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette().backgroundContentCard,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: content,
        ),
      ),
    );
  }
}
