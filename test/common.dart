import 'dart:io';
import 'dart:typed_data';

final Uint8List sampleFileBytes = File('data/sample.txt').readAsBytesSync();
const String kSampleFileName = 'sample.txt';
