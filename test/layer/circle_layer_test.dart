import 'package:flutter/material.dart';
import 'package:flutter_map/src/layer/circle_layer.dart';
import 'package:flutter_map/src/map/widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

import '../test_utils/test_app.dart';

void main() {
  testWidgets('test circle marker key', (tester) async {
    const key = Key('c-1');

    final circles = <CircleMarker>[
      CircleMarker(
        key: key,
        point: const LatLng(51.5, -0.09),
        color: Colors.blue.withOpacity(0.7),
        borderStrokeWidth: 2,
        useRadiusInMeter: true,
        radius: 2000,
      ),
    ];

    await tester.pumpWidget(TestApp(circles: circles));
    expect(find.byType(FlutterMap), findsOneWidget);
    expect(find.byType(CircleLayer), findsWidgets);
    expect(find.byKey(key), findsOneWidget);
  });
}
