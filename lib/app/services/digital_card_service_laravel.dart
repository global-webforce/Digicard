import 'dart:async';
import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/api/api_endpoints.dart';
import 'package:digicard/app/constants/color_pallette.dart';
import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:faker/faker.dart' as fkr;
import 'package:uuid/uuid.dart';

class DigitalCardServiceLaravel
    with ListenableServiceMixin
    implements DigitalCardService {
  final _apiService = locator<ApiService>();
  final _appService = locator<AppService>();

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
    await Future.delayed(const Duration(seconds: 2));
    digitalCards.add(
      card.copyWith(
        id: fkr.random.integer(999, min: 500),
        userId: _appService.user?.id,
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
    await Future.delayed(const Duration(seconds: 2));

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

    notifyListeners();
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
    await Future.delayed(const Duration(seconds: 2));
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
    await _apiService.get(
      ApiEndpoints.instance.notifications(),
      onSuccess: (res) async {
        _digitalCards.value = List.generate(
            2,
            (index) => DigitalCard(
                  id: index,
                  uuid: uuid.v5(Uuid.NAMESPACE_URL, 'www.digicard.com'),
                  userId: index + 1,
                  title: fkr.random.element([
                    "PERSONAL EVENTS",
                    "WORK EVENTS",
                    "PARTY EVENTS",
                    "MEETUP EVENTS",
                    "DATING EVENTS"
                  ]),
                  logoImage: fkr.faker.randomGenerator.element([
                    "https://globalwebforce.com/wp-content/uploads/2021/06/cropped-nav-logo.png",
                    "https://brandslogos.com/wp-content/uploads/thumbs/famous-amos-logo-vector.svg",
                    "https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/05/Shell_logo.svg-e1659037248878.png?auto=format&q=60&fit=max&w=930"
                        "https://global-uploads.webflow.com/5e157548d6f7910beea4e2d6/611e17ec949adb702e521eb5_4Em9cry00PqgpP_mCCrgJ_OmdqSMCzQVgEYtfvDrfM3eBL3zBMvBZ4TxXHUVdgXWiwySmgYSFXmKx86BS10Yk2fVQhKTFOXTYlxKPsII1HBYjkvQ3d14PFsOfFbk51boJMEI6Ns7.png"
                  ]),
                  profileImage: fkr.random.element([
                    "https://i.ibb.co/ZGvP38P/profile-1.png",
                  ])
                  /*   fkr.faker.image.image(
                    random: true,
                    width: 700,
                  ), */
                  ,
                  prefix: fkr.faker.person.prefix(),
                  firstName: fkr.faker.person.firstName(),
                  middleName: fkr.faker.person.lastName(),
                  lastName: fkr.faker.person.lastName(),
                  suffix: fkr.faker.person.suffix(),
                  shortBio: fkr.faker.lorem.sentences(5).join(" "),
                  position: fkr.faker.company.position(),
                  company: fkr.faker.company.name(),
                  email: fkr.faker.internet.email(),
                  address: fkr.faker.address.city(),
                  mobileNumber: fkr.faker.phoneNumber.us(),
                  website: fkr.faker.internet.httpsUrl(),
                  goesBy: fkr.faker.person.name(),
                  color: fkr.random
                      .element(cardColors.map((e) => e.toHex()).toList()),
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ));
      },
      onError: (_) {},
    );
  }

  @override
  List<DigitalCard> get digitalCards {
    _digitalCards.value.sort((a, b) {
      return b.createdAt!
          .compareTo(a.createdAt ?? DateTime.fromMicrosecondsSinceEpoch(0));
    });
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
    } catch (e) {
      rethrow;
    }
  }
}
