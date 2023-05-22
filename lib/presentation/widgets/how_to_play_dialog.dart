import 'package:carousel_slider/carousel_slider.dart';
import 'package:financial_literacy_game/config/color_palette.dart';
import 'package:financial_literacy_game/presentation/widgets/menu_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'cash_indicator.dart';
import 'next_period_button.dart';



class HowToPlayDialog extends ConsumerWidget {
    
  // ignore: prefer_const_constructors_in_immutables
  const HowToPlayDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String text1 = translate("1. Click the \"NEXT\" button on the top right corner to start the game.");
    String text2 = translate("2. You can buy an animal with cash, take a loan or decide not to buy the asset.");
    String text3 = translate("3. Each round animals vary in price, income and life expectancy.");
    String text4 = translate("4. You might find the calculations underneath the animal card helpful.");
    String text5 = translate("5. You have to reach a certain amount of cash to move to the next level.");
    String mtext = translate("cash goal");
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
                children: [
                  NextPeriodButton(isDemonstrationMode: true),
                  SizedBox(height: 20.0),
                  Text(
                    text1,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
             HowToPlayCard(
              content: Text(
                text2,
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
             HowToPlayCard(
              content: Text(
               text3,
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
             HowToPlayCard(
              content: Text(
                text4,
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            HowToPlayCard(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$mtext'
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
                   Text(
                    text5,
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
