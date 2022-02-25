import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_document_scanner/src/bloc/app/app_state.dart';
import 'package:flutter_document_scanner/src/models/area.dart';

abstract class AppEvent extends Equatable {}

class AppCameraInitialized extends AppEvent {
  final CameraLensDirection cameraLensDirection;
  final ResolutionPreset resolutionCamera;

  AppCameraInitialized({
    required this.cameraLensDirection,
    required this.resolutionCamera,
  });

  @override
  List<Object?> get props => [
        cameraLensDirection,
        resolutionCamera,
      ];
}

class AppPhotoTaken extends AppEvent {
  final double? minContourArea;

  AppPhotoTaken({
    this.minContourArea,
  });

  @override
  List<Object?> get props => [
        minContourArea,
      ];
}

class AppPageChanged extends AppEvent {
  final AppPages newPage;

  AppPageChanged(this.newPage);

  @override
  List<Object?> get props => [
        newPage,
      ];
}

class AppPhotoCropped extends AppEvent {
  AppPhotoCropped();

  @override
  List<Object?> get props => [];
}

class AppLoadCroppedPhoto extends AppEvent {
  final Uint8List image;
  final Area area;

  AppLoadCroppedPhoto({
    required this.image,
    required this.area,
  });

  @override
  List<Object?> get props => [
        image,
        area,
      ];
}
