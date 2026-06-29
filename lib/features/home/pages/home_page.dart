import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/models/contact_intent.dart';
import '../../../core/services/landing_actions.dart';
import '../../../core/services/seo_service.dart';
import '../../../core/utils/scroll_utils.dart';
import '../../contact/widgets/contact_section.dart';
import '../../faq/widgets/faq_section.dart';
import '../../features/widgets/features_sections.dart';
import '../../footer/widgets/footer_section.dart';
import '../../hero/widgets/hero_section.dart';
import '../../memberships/widgets/memberships_section.dart';
import '../../wallet/widgets/detail_sections.dart';
import '../../../shared/widgets/glass_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  bool _scrolled = false;
  ContactIntent? _contactIntent;

  final _sectionKeys = <String, GlobalKey>{
    'hero': GlobalKey(),
    'features': GlobalKey(),
    'wallet': GlobalKey(),
    'delivery': GlobalKey(),
    'events': GlobalKey(),
    'reservations': GlobalKey(),
    'promotions': GlobalKey(),
    'family': GlobalKey(),
    'kids': GlobalKey(),
    'memberships': GlobalKey(),
    'business': GlobalKey(),
    'download': GlobalKey(),
    'faq': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    SeoService.updateHome();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = _scrollController.offset > 50;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToSection(String key) {
    final sectionKey = _sectionKeys[key];
    if (sectionKey != null) {
      scrollToSection(_scrollController, sectionKey);
    }
  }

  void _scrollToDownload() => _navigateToSection('download');

  void _goToContact(ContactIntent intent) {
    setState(() => _contactIntent = intent);
    _navigateToSection('contact');
  }

  void _onMembershipPlanSelected(MembershipItem plan) {
    switch (plan.category) {
      case MembershipCategory.consumer:
        _scrollToDownload();
      case MembershipCategory.business:
        _onRegisterBusiness();
      case MembershipCategory.enterprise:
        _goToContact(ContactIntent.enterprise());
    }
  }

  Future<void> _onRegisterBusiness() async {
    if (UrlConstants.businessPanelUrl.isNotEmpty) {
      await LandingActions.openBusinessPanel(context);
      return;
    }
    _goToContact(ContactIntent.business());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['hero'],
                  child: HeroSection(
                    onDownload: _scrollToDownload,
                    onExplore: () => _navigateToSection('features'),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: StatsSection()),
              const SliverToBoxAdapter(child: AboutSection()),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['features'],
                  child: FeaturesGridSection(onLearnMore: _navigateToSection),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['wallet'],
                  child: const WalletSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['delivery'],
                  child: const DeliverySection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['events'],
                  child: const EventsSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['reservations'],
                  child: const ReservationsSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['promotions'],
                  child: const PromotionsSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['family'],
                  child: const FamilySection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['kids'],
                  child: const KidsSection(),
                ),
              ),
              const SliverToBoxAdapter(child: HowItWorksSection()),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['memberships'],
                  child: MembershipsSection(
                    onPlanSelected: _onMembershipPlanSelected,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['business'],
                  child: BusinessSection(
                    onRegisterBusiness: _onRegisterBusiness,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SecuritySection()),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['download'],
                  child: const DownloadSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['faq'],
                  child: const FaqSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys['contact'],
                  child: ContactSection(
                    intent: _contactIntent,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FooterSection(onNavTap: _navigateToSection),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GlassNavbar(
              scrolled: _scrolled,
              onNavTap: _navigateToSection,
              onDownloadTap: _scrollToDownload,
            ),
          ),
        ],
      ),
    );
  }
}
