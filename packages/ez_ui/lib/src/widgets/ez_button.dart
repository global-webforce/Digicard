import 'package:flutter/material.dart';

class EzButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool outline;
  final IconData? leading;
  final Color? background;
  final Color? foreground;
  final bool rounded;

  const EzButton.elevated(
      {required this.title,
      Key? key,
      this.disabled = false,
      this.busy = false,
      this.onTap,
      this.leading,
      this.background,
      this.foreground,
      this.rounded = false,
      this.onLongPress})
      : outline = false,
        super(key: key);

  const EzButton.outline(
      {required this.title,
      Key? key,
      this.onTap,
      this.leading,
      this.background,
      this.foreground,
      this.rounded = false,
      this.onLongPress})
      : disabled = false,
        busy = false,
        outline = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonBackgroundColor = background != null
        ? MaterialStateProperty.all(background)
        : MaterialStateProperty.all(
            Theme.of(context).appBarTheme.backgroundColor);

    final buttonRadius = MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius:
            rounded ? BorderRadius.circular(30.0) : BorderRadius.circular(10.0),
      ),
    );
    final buttonBorder = MaterialStateProperty.all(
      BorderSide(
        color: background ?? Theme.of(context).colorScheme.primary,
        width: 1.0,
        style: BorderStyle.solid,
      ),
    );

    Widget _loading() {
      return const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      );
    }

    Widget _icon() {
      if (leading != null) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            leading,
            color: outline ? background : foreground,
            size: 22,
          ),
        );
      }
      return const SizedBox.shrink();
    }

    Widget _text() {
      return Text(
        title,
        style:
            TextStyle(fontSize: 18, color: outline ? background : foreground),
      );
    }

    Widget content() {
      return busy
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const SizedBox.shrink(), _loading()],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_icon(), _text()],
            );
    }

    Widget _outlinedButton() {
      return OutlinedButton(
        style: disabled
            ? null
            : ButtonStyle(
                shape: buttonRadius,
                side: buttonBorder,
              ),
        onPressed: busy || disabled ? () {} : () => onTap!(),
        onLongPress: busy || disabled || busy ? () {} : onLongPress,
        child: content(),
      );
    }

    Widget _elevatedButton() {
      return ElevatedButton(
        style: ButtonStyle(
          shape: buttonRadius,
          backgroundColor: disabled ? null : buttonBackgroundColor,
        ),
        onPressed: disabled || busy ? null : onTap,
        onLongPress: disabled || busy ? null : onLongPress,
        child: content(),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 45,
        maxHeight: 45,
        minWidth: 120,
        maxWidth: double.infinity,
      ),
      child: outline ? _outlinedButton() : _elevatedButton(),
    );
  }
}
