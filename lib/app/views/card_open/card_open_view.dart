import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.model.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';
import 'package:touchable/touchable.dart';

class CardOpenView extends StatelessWidget {
  const CardOpenView({Key? key, required this.card}) : super(key: key);

  final DigitalCard card;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardOpenViewModel>.reactive(
        viewModelBuilder: () => locator<CardOpenViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {},
        builder: (context, viewModel, child) {
          Widget logo() {
            return Container(
                color: Colors.red,
                width: double.infinity,
                height: 70,
                child: CanvasTouchDetector(
                  gesturesToOverride: const [GestureType.onTapDown],
                  builder: (context) => CustomPaint(
                    painter: RPSCustomPainter(
                        context, Theme.of(context).scaffoldBackgroundColor),
                    child: GestureDetector(
                      onTapDown: (details) => print("fdsfsf"),
                      child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EzButton.elevated(
                              title: "fdsfsf",
                              onTap: () {
                                print("XXXXXX");
                              },
                            )

                            /* Image.network(
                              "https://www.edigitalagency.com.au/wp-content/uploads/google-logo-png-transparent-background-large-new.png",
                              width: 180,
                            ), */
                            ),
                      ),
                    ),
                  ),
                ));
          }

          Widget imageProfile() {
            return Center(
              child: Image.network(
                "https://images.unsplash.com/photo-1677629828138-3794ff1653c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
                width: double.infinity,
                height: 380,
                fit: BoxFit.cover,
              ),
            );
          }

          Widget bevel() {
            return Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                /*      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.2],
                    colors: [Colors.red, Colors.white]), */
              ),
            );
          }

          Widget contentBody() {
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${card.name}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${card.title}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    vSpaceSmall,
                    Text(
                      "${card.company}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: HexColor("${card.color}")),
                    ),
                    vSpaceRegular,
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return SafeArea(
            child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: const BackButton(),
                  actions: const [],
                ),
                bottomSheet: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: EzButton.elevated(
                    leading: Icons.save_rounded,
                    title: "Save Contact",
                    onLongPress: () {},
                  ),
                ),
                body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      primary: false,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              vSpaceRegular,
                              imageProfile(),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: logo(),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: bevel(),
                              ),
                            ],
                          ),
                          contentBody(),
                        ],
                      )),
                )),
          );
        });
  }
}

class RPSCustomPainter extends CustomPainter {
  late BuildContext context;
  final Color color;

  RPSCustomPainter(this.context, this.color);

  Path path = Path();

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.1008500, size.height * -0.0095000,
        size.width * 0.1225000, size.height * 0.5000000);
    path.quadraticBezierTo(size.width * 0.1513500, size.height * 1.0092000,
        size.width * 0.2521000, size.height);
    path.lineTo(size.width * 0.7455500, size.height);
    path.quadraticBezierTo(size.width * 0.8515750, size.height * 0.9955000,
        size.width * 0.8750000, size.height * 0.5000000);
    path.quadraticBezierTo(
        size.width * 0.9010250, size.height * 0.0045000, size.width, 0);

    myCanvas.drawPath(
      path,
      paint0,
      onTapDown: (details) {
        print("GGGGG");
      },
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
