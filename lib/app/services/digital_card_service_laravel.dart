import 'dart:async';
import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:faker/faker.dart' as fkr;
import 'package:uuid/uuid.dart';

class DigitalCardServiceLaravel
    with ListenableServiceMixin
    implements DigitalCardService {
  final _apiService = locator<ApiService>();
  final _authService = locator<AuthService>();

  DigitalCardServiceLaravel() {
    listenToReactiveValues([
      _digitalCards,
    ]);
  }

  final ReactiveValue<List<DigitalCard>> _digitalCards =
      ReactiveValue<List<DigitalCard>>([]);

  var uuid = const Uuid();

  @override
  Future create(DigitalCard card) async {
    await Future.delayed(const Duration(seconds: 1));
    digitalCards.add(
      card.copyWith(
        id: fkr.random.integer(999, min: 500),
        userId: _authService.supabase.auth.currentUser?.id,
        uuid: uuid.v5(Uuid.NAMESPACE_URL, 'www.digicard.com'),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    notifyListeners();
    /*    await _apiService.post(
      ApiEndpoints.instance.addService(),
      requestBody: formData,
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    ); */
  }

  @override
  Future update(DigitalCard card) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final item = digitalCards.firstWhere((element) => element.id == card.id);
      final itemPosition =
          digitalCards.indexWhere((element) => element.id == card.id);
      digitalCards[itemPosition] = card.copyWith(
        id: item.id,
        userId: digitalCards[itemPosition].userId,
        createdAt: digitalCards[itemPosition].createdAt,
        updatedAt: DateTime.now(),
      );
      notifyListeners();
    } catch (e) {
      rethrow;
    }

    /*    await _apiService.post(
      ApiEndpoints.instance.addService(),
      requestBody: card.toJson(),
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    ); */
  }

  @override
  Future delete(DigitalCard card) async {
    await Future.delayed(const Duration(seconds: 1));
    digitalCards.removeWhere((e) => e.id == card.id);
    notifyListeners();
    /*  await _apiService.delete(
      ApiEndpoints.instance.deleteService(id),
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    ); */
  }

  @override
  Future getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    _digitalCards.value = List.generate(
        20,
        (index) => DigitalCard(
              id: index,
              uuid: uuid.v5(Uuid.NAMESPACE_URL, 'www.digicard.com'),
              userId: "fdsfsf45",
              title: fkr.random.element([
                "PERSONAL EVENTS",
                "WORK EVENTS",
                "PARTY EVENTS",
                "MEETUP EVENTS",
                "DATING EVENTS"
              ]),
              logoUrl: fkr.faker.randomGenerator.element([
                "https://globalwebforce.com/wp-content/uploads/2021/06/cropped-nav-logo.png",
                "https://ezyworkforceandeducationpartners.com/wp-content/uploads/2023/02/ewep-svg-logo-original-with-tagline.png",
                "https://upload.wikimedia.org/wikipedia/commons/c/c7/Ford-Motor-Company-Logo.png",
                "https://upload.wikimedia.org/wikipedia/commons/4/4b/DiscoverCarscom-company-logo.png"
                    "https://upload.wikimedia.org/wikipedia/en/a/a9/Philam_Life_logo.png",
                "https://upload.wikimedia.org/wikipedia/commons/a/a0/CC_United_Co_Logo.png",
              ]),
              avatarUrl: /* fkr.random.element([
                    "https://i.ibb.co/ZGvP38P/profile-1.png",
                  ]) */
                  fkr.faker.image.image(
                      random: true,
                      width: 400,
                      height: 400,
                      keywords: ["face", "portrait"]),
              prefix: fkr.faker.person.prefix(),
              firstName: fkr.faker.person.firstName(),
              middleName: fkr.faker.person.lastName(),
              lastName: fkr.faker.person.lastName(),
              suffix: fkr.faker.person.suffix(),
              accreditations: fkr.faker.company.position(),
              maidenName: fkr.faker.person.firstName(),
              preferredName: fkr.faker.person.firstName(),
              pronouns: fkr.faker.food.dish(),
              headline: fkr.faker.lorem.sentences(5).join(" "),
              position: fkr.faker.job.title(),
              department: fkr.faker.job.title(),
              company: fkr.faker.company.name(),
              customLinks: [
                CustomLink(
                  label: "Email",
                  text: fkr.faker.internet.safeEmail(),
                  type: 'Email',
                ),
                CustomLink(
                  label: "Address",
                  text: fkr.faker.address.streetAddress(),
                  type: 'Address',
                ),
                CustomLink(
                  label: "Phone Number",
                  text: fkr.faker.phoneNumber.us(),
                  type: 'Phone Number',
                ),
                CustomLink(
                  label: "Website",
                  text: fkr.faker.internet.httpUrl(),
                  type: 'Website',
                )
              ],
              color: fkr.random.element(cardColors.map((e) => e).toList()),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ));
    /*    await _apiService.get(
      ApiEndpoints.instance.notifications(),
      onSuccess: (res) async {
    
      },
      onError: (_) {},
    ); */
  }

  @override
  List<DigitalCard> get digitalCards {
    return _digitalCards.value;
  }

  @override
  duplicate(DigitalCard digitalCard) {
    try {
      int index = digitalCards.indexWhere((e) => e.id == digitalCard.id);
      digitalCards.insert(
          index + 1,
          digitalCard.copyWith(
            id: DateTime.now().millisecondsSinceEpoch,
          ));
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
