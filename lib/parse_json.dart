import 'package:flutter/material.dart';
import 'package:flutter_class_parser/parse_json.dart';

import 'morphable_shape_border.dart';

CornerStyle? parseCornerStyle(String? string) {
  if (string == null) return null;
  switch (string) {
    case "rounded":
      return CornerStyle.rounded;
    case "concave":
      return CornerStyle.concave;
    case "straight":
      return CornerStyle.straight;
    case "cutout":
      return CornerStyle.cutout;
  }
  return null;
}

ShapeSide? parseShapeSide(String? string) {
  if (string == null) return null;
  switch (string) {
    case "top":
      return ShapeSide.top;
    case "bottom":
      return ShapeSide.bottom;
    case "left":
      return ShapeSide.left;
    case "right":
      return ShapeSide.right;
  }
  return null;
}

ShapeCorner? parseShapeCorner(String? string) {
  if (string == null) return null;
  switch (string) {
    case "topLeft":
      return ShapeCorner.topLeft;
    case "topRight":
      return ShapeCorner.topRight;
    case "bottomLeft":
      return ShapeCorner.bottomLeft;
    case "bottomRight":
      return ShapeCorner.bottomRight;
    case "leftTop":
      return ShapeCorner.leftTop;
    case "leftBottom":
      return ShapeCorner.leftBottom;
    case "rightTop":
      return ShapeCorner.rightTop;
    case "rightBottom":
      return ShapeCorner.rightBottom;
  }
  return null;
}

DynamicPath? parseDynamicPath(Map<String, dynamic>? map) {

  if (map == null || map["name"] == null) return null;
  Size? size=parseSize(map["size"]);
  List<DynamicNode>? nodes=(map["nodes"] as List).map((e) => DynamicNode.fromJson(e)).toList();
  if(size==null || nodes==null) {
    return null;
  }else{
    return DynamicPath(size: size, nodes: nodes);
  }
}

Shape? parseShape(Map<String, dynamic>? map) {
  if (map == null || map["name"] == null) return null;

  String shapeName = map["name"];
  switch (shapeName) {
    case "ArcShape":
      return ArcShape.fromJson(map);
    case "ArrowShape":
      return ArrowShape.fromJson(map);
    case "BubbleShape":
      return BubbleShape.fromJson(map);
    case "CircleShape":
      return CircleShape.fromJson(map);
    //case "DiagonalShape":
    //  return DiagonalShape.fromJson(map);
    //case "CutCornerShape":
    //  return CutCornerShape.fromJson(map);
    case "PolygonShape":
      return PolygonShape.fromJson(map);
    case "RectangleShape":
      return RectangleShape.fromJson(map);
    case "StarShape":
      return StarShape.fromJson(map);
    case "TrapezoidShape":
      return TrapezoidShape.fromJson(map);
    case "TriangleShape":
      return TriangleShape.fromJson(map);
    default:
      return null;
  }

}

MorphableShapeBorder? parseMorphableShapeBorder(Map<String, dynamic>? map) {
  if (map == null) return null;
  return MorphableShapeBorder(
    shape: parseShape(map["shape"]) ??
        RectangleShape(borderRadius: DynamicBorderRadius.all(DynamicRadius.zero)),
    borderWidth: map["borderWidth"] ?? 0.0,
    borderColor: parseColor(map["borderColor"]) ?? Colors.black,
  );
}