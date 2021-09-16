import 'package:flutter/material.dart';
import 'package:handi/constants.dart';

/// Style for h1 level text
const TextStyle h1 = TextStyle();

/// Style for h2 level text
const TextStyle h2 = TextStyle();

/// Style for h3 level text
const TextStyle h3 = TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

/// Style for p level text
const TextStyle p = TextStyle(
  fontWeight: FontWeight.normal,
  decoration: TextDecoration.none,
  color: Colors.black,
  fontSize: 16,
);

const TextStyle p_primary = TextStyle(
  fontWeight: FontWeight.normal,
  decoration: TextDecoration.none,
  color: kPrimaryColor,
  fontSize: 16,
);

TextStyle pScaled(double factor, bool primary) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    color: primary ? kPrimaryColor : Colors.black,
    fontSize: 16 * factor,
  );
}

/// Modal box style
const BoxDecoration modalBox = BoxDecoration(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(kDefaultPadding),
  ),
  color: Colors.white,
);
