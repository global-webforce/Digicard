import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helpers/sliver_grid_delegate.dart';
import '../models/custom_link.dart';
import 'dialog.dart';

class IconsList extends StatefulWidget {
  final Color? backgroundColor;
  final List<CustomLink> customLinks;
  final Function(CustomLink customLink) onLinkCreated;
  const IconsList(
      {super.key,
      required this.onLinkCreated,
      required this.customLinks,
      this.backgroundColor});

  @override
  State<IconsList> createState() => _IconsListState();
}

class _IconsListState extends State<IconsList> {
  @override
  Widget build(BuildContext context) {
    removeFocus() {
      final FocusScopeNode currentScope = FocusScope.of(context);
      if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }

    return Container(
        decoration: BoxDecoration(
            color: widget.backgroundColor ?? Theme.of(context).primaryColor),
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: widget.customLinks.length,
          primary: false,
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: (MediaQuery.of(context).size.width < 768.0) ? 4 : 6,
            height: 80,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                removeFocus();
                await showMyDialog(context, widget.customLinks[index])
                    .then((value) {
                  if (value != null) {
                    widget.onLinkCreated(value);
                  }
                });
              },
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    widget.customLinks[index].icon ??
                        const Icon(
                          FontAwesomeIcons.accessibleIcon,
                          color: Colors.white,
                          size: 15,
                        ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${widget.customLinks[index].label}",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
