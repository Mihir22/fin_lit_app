import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/color_palette.dart';
import '../../config/constants.dart';
import '../../domain/concepts/person.dart';
import '../../domain/entities/levels.dart';
import '../../domain/game_data_notifier.dart';
import '../../domain/utils/device_and_personal_data.dart';
import '../../domain/utils/utils.dart';
import '../widgets/asset_content.dart';
import '../widgets/game_app_bar.dart';
import '../widgets/how_to_play_dialog.dart';
import '../widgets/level_info_card.dart';
import '../widgets/loan_content.dart';
import '../widgets/menu_dialog.dart';
import '../widgets/overview_content.dart';
import '../widgets/personal_content.dart';
import '../widgets/section_card.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_translate/flutter_translate.dart';

 
class Homepage extends ConsumerStatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}


class _HomepageState extends ConsumerState<Homepage> {
  late TextEditingController firstNameTextController;
  late TextEditingController lastNameTextController;
 

  bool setPersonData(Person enteredPerson) {
    if (enteredPerson.firstName == '' || enteredPerson.lastName == '') {
      showErrorSnackBar(
        context: context,
        errorMessage: translate('Please enter first and last name.'),
      );
      return false;
    }

    savePerson(enteredPerson);
    ref.read(gameDataNotifierProvider.notifier).setPerson(enteredPerson);
    return true;
  }

  @override
  void initState() {
    firstNameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
    

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String text1 = translate("Dear Participant, Thank you for participating. This game is intended to simulate financial investment decisions and teach financial skills. It is used only for this purpose. We emphasize that no part of this gaming exercise affects your relationship with your bank. Please enter your contact information below:");
      String fname = translate("first name");
      String lname = translate("last name");
      await getDeviceInfo();
      loadPerson(ref: ref).then((personLoaded) {
        if (!personLoaded) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return MenuDialog(
                  showCloseButton: false,
                  title: translate('Welcome to the FinSim Game'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(text1),
                      TextField(
                        controller: firstNameTextController,
                        decoration:  InputDecoration(hintText: fname),
                      ),
                      TextField(
                        controller: lastNameTextController,
                        decoration:  InputDecoration(hintText: lname),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        backgroundColor: ColorPalette().buttonBackground,
                        foregroundColor: ColorPalette().lightText,
                      ),
                      onPressed: () {
                        if (setPersonData(
                          Person(
                            firstName: firstNameTextController.text,
                            lastName: lastNameTextController.text,
                          ),
                        )) Navigator.of(context).pop();
                      },
                      child: Text(translate('Start game')),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        backgroundColor: ColorPalette().buttonBackground,
                        foregroundColor: ColorPalette().lightText,
                      ),
                      onPressed: () {
                        if (setPersonData(
                          Person(
                            firstName: firstNameTextController.text,
                            lastName: lastNameTextController.text,
                          ),
                        )) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const HowToPlayDialog();
                            },
                          );
                        }
                      },
                      child: Text(translate('How to play')),
                      
                    ),
                  ],
                );
              });
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameTextController.dispose();
    lastNameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int levelId = ref.watch(gameDataNotifierProvider).levelId;
    
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorPalette().background,
          appBar: const GameAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: playAreaMaxWidth),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        LevelInfoCard(
                          currentCash: ref.watch(gameDataNotifierProvider).cash,
                          levelId: levelId,
                          nextLevelCash: levels[levelId].cashGoal,
                        ),
                        const SizedBox(height: 10),
                        const SectionCard(
                          title: 'OVERVIEW',
                          content: OverviewContent(),
                        ),
                        const SizedBox(height: 10),
                        if (levels[ref.read(gameDataNotifierProvider).levelId]
                            .includePersonalIncome)
                          const SectionCard(title: 'PERSONAL', content: PersonalContent()),
                        if (levels[ref.read(gameDataNotifierProvider).levelId]
                            .includePersonalIncome)
                          const SizedBox(height: 10),
                        const SectionCard(
                          title: 'ASSETS',
                          content: AssetContent(),
                        ),
                        const SizedBox(height: 10),
                        const SectionCard(
                          title: 'LOANS',
                          content: LoanContent(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: ref.read(gameDataNotifierProvider).confettiController,
            shouldLoop: true,
            emissionFrequency: 0.03,
            numberOfParticles: 20,
            maxBlastForce: 25,
            minBlastForce: 7,
            // colors: [
            //   ColorPalette().lightText,
            //   ColorPalette().cashIndicator,
            //   ColorPalette().backgroundContentCard,
            // ],
            gravity: 0.2,
            particleDrag: 0.05,
            blastDirection: pi,
            blastDirectionality: BlastDirectionality.explosive,
          ),
        ),
      ],
    );
  }
}
