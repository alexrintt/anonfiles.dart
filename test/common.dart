import 'dart:io';
import 'dart:typed_data';

import 'package:anonfiles/anonfiles.dart';

final Uint8List sampleFileBytes = File('data/sample.txt').readAsBytesSync();
const String kSampleFileName = 'sample.txt';
