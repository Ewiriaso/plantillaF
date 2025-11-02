import 'package:flareline/pages/auth/sign_up/sign_up_provider.dart';
import 'package:flareline_uikit/core/mvvm/base_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpWidget extends BaseWidget<SignUpProvider> {
  SignUpWidget({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, SignUpProvider viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: GlobalColors.background,
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
              return contentDesktopWidget(context,viewModel);
            }
            return SingleChildScrollView(
              child: contentMobileWidget(context,viewModel),
            );
          },
        ),
      )
    );
  }

  @override
  SignUpProvider viewModelBuilder(BuildContext context) {
    return SignUpProvider(context);
  }

  Widget contentDesktopWidget(BuildContext context, SignUpProvider viewModel) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.appName,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.slogan,
                    style: const TextStyle(
                      fontSize: 18,
                      color: GlobalColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: 450,
                    child: SvgPicture.asset('assets/signin/signup.svg',
                        semanticsLabel: ''),
                  )
                ],
              ),
            ),
            const SizedBox(width: 80),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: GlobalColors.primary.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: _formWidget(context, viewModel),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget contentMobileWidget(BuildContext context, SignUpProvider viewModel) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            AppLocalizations.of(context)!.appName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: GlobalColors.primary,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: GlobalColors.primary.withOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: _formWidget(context, viewModel),
          ),
        ],
      ),
    );
  }

  Widget _formWidget(BuildContext context, SignUpProvider viewModel) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth > 600 ? 0 : 20;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.startForFree,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: GlobalColors.primary,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Crea tu cuenta y comienza ahora',
            style: const TextStyle(
              fontSize: 14,
              color: GlobalColors.textSecondary,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          OutBorderTextFormField(
            labelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.emailHint,
            keyboardType: TextInputType.emailAddress,
            suffixWidget: SvgPicture.asset(
              'assets/signin/email.svg',
              width: 22,
              height: 22,
            ),
            controller: viewModel.emailController,
          ),
          const SizedBox(
            height: 16,
          ),
          OutBorderTextFormField(
            obscureText: true,
            labelText: AppLocalizations.of(context)!.password,
            hintText: AppLocalizations.of(context)!.passwordHint,
            suffixWidget: SvgPicture.asset(
              'assets/signin/lock.svg',
              width: 22,
              height: 22,
            ),
            controller: viewModel.passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          OutBorderTextFormField(
            obscureText: true,
            labelText: AppLocalizations.of(context)!.retypePassword,
            hintText: AppLocalizations.of(context)!.retypePasswordHint,
            suffixWidget: SvgPicture.asset(
              'assets/signin/lock.svg',
              width: 22,
              height: 22,
            ),
            controller: viewModel.rePasswordController,
          ),
          const SizedBox(
            height: 24,
          ),
          ButtonWidget(
            type: ButtonType.secondary.type,
            btnText: AppLocalizations.of(context)!.createAccount,
            height: 48,
            fontSize: 16,
            borderRadius: 8,
            onTap: () {
              viewModel.signUp(context);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.haveAnAccount,
                style: const TextStyle(
                  color: GlobalColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                child: Text(
                  AppLocalizations.of(context)!.signIn,
                  style: const TextStyle(
                    color: GlobalColors.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/signIn');
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get isPage => true;

  @override
  bool get showTitle => false;

  @override
  bool get isAlignCenter => true;
}
