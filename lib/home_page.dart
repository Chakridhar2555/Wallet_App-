// Import necessary packages
import 'package:flutter/material.dart';
import 'package:wallet_app_workshop/core/constants.dart';
import 'package:wallet_app_workshop/core/data.dart';
import 'package:wallet_app_workshop/core/styles.dart';
import 'package:wallet_app_workshop/core/widgets/wallet.dart';
import 'package:wallet_app_workshop/credit-cards/credit_cards_page.dart';
import 'package:wallet_app_workshop/developer/developer_page.dart'; // Import the DeveloperPage

import 'payment/payment_bottom_sheet.dart';

// Define the HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

 final List<TabItem> tabItems = [
    TabItem(
      title: 'Cards',
      view: CreditCardsPage(),
    ),
    TabItem(view: Container()),
    TabItem(
      title: 'Developer',
      view: DeveloperPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(tabItems[currentPageIndex].title),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10,
            left: Constants.appHPadding / 2,
            right: Constants.appHPadding / 2,
            height: 500,
            child: Wallet(
              width: screenSize.width,
              height: 500,
            ),
          ),
          NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: <Widget>[
              NavigationDestination(
                selectedIcon: Image.asset(
                  'assets/icons/cards-active.png',
                  width: 35,
                  height: 35,
                ),
                icon: Image.asset(
                  'assets/icons/cards.png',
                  width: 35,
                  height: 35,
                ),
                label: 'Cards',
              ),
              Center(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    fixedSize: const Size(
                      Constants.walletStrapWidth * 0.6,
                      Constants.walletStrapWidth * 0.6,
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: AppColors.onBlack,
                      elevation: 0,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      showDragHandle: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      builder: (context) => const PaymentBottomSheet(),
                    );
                  },
                ),
              ),
              NavigationDestination(
                selectedIcon: Image.asset(
                  'assets/developer-active.png',
                  width: 30,
                  height: 30,
                ),
                icon: Image.asset(
                  'assets/icon.png',
                  width: 30,
                  height: 30,
                ),
                label: 'Developer',
              ),
            ],
          ),
        ],
      ),
      body: tabItems[currentPageIndex].view,
    );
  }
}
