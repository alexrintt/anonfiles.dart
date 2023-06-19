import 'dart:io';
import 'dart:typed_data';

final Uint8List sampleFileBytes = File('data/sample.txt').readAsBytesSync();

final Stream<Uint8List> sampleFileByteStream =
    Stream<Uint8List>.fromIterable(<Uint8List>[sampleFileBytes]);

final int sampleFileLength = sampleFileBytes.length;

const String kSampleFileName = 'sample.txt';
