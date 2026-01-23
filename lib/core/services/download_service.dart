import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadService {
  static final DownloadService _instance = DownloadService._internal();
  late FlutterLocalNotificationsPlugin _notificationsPlugin;
  final Dio _dio = Dio();

  DownloadService._internal() {
    _initializeNotifications();
  }

  factory DownloadService() {
    return _instance;
  }

  void _initializeNotifications() {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    
    const AndroidInitializationSettings androidInitSettings = 
      AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const DarwinInitializationSettings iosInitSettings = 
      DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    _notificationsPlugin.initialize(initSettings);
  }

  Future<bool> _requestPermissions() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      return status.isGranted;
    }
    return true;
  }

  Future<String?> _getDownloadPath() async {
    try {
      // Intentar obtener directorio de descargas
      final downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        return downloadsDirectory.path;
      }
      
      // Si no funciona, usar directorio de documentos
      final appDocDir = await getApplicationDocumentsDirectory();
      return appDocDir.path;
    } catch (e) {
      print('Error obteniendo ruta de descarga: $e');
      return null;
    }
  }

  Future<void> downloadFile({
    required String url,
    required String fileName,
    required Function(double) onProgress,
    required Function(String) onComplete,
    required Function(String) onError,
  }) async {
    try {
      // Solicitar permisos
      final hasPermission = await _requestPermissions();
      if (!hasPermission) {
        onError('Permiso de almacenamiento denegado');
        return;
      }

      // Obtener directorio de descargas
      final downloadPath = await _getDownloadPath();
      if (downloadPath == null) {
        onError('No se pudo obtener el directorio de descargas');
        return;
      }

      final savePath = '$downloadPath/$fileName';

      // Crear notificación inicial
      const AndroidNotificationDetails androidDetails = 
        AndroidNotificationDetails(
          'download_channel',
          'Descargas',
          channelDescription: 'Notificaciones de descarga',
          importance: Importance.low,
          progress: 0,
          maxProgress: 100,
          indeterminate: false,
          showProgress: true,
        );

      const DarwinNotificationDetails iosDetails = 
        DarwinNotificationDetails();

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _notificationsPlugin.show(
        0,
        'Descargando',
        '$fileName',
        notificationDetails,
      );

      // Descargar archivo
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          final progress = received / total;
          onProgress(progress);

          // Actualizar notificación con progreso
          _notificationsPlugin.show(
            0,
            'Descargando',
            '$fileName',
            NotificationDetails(
              android: AndroidNotificationDetails(
                'download_channel',
                'Descargas',
                channelDescription: 'Notificaciones de descarga',
                importance: Importance.low,
                progress: (progress * 100).toInt(),
                maxProgress: 100,
                indeterminate: false,
                showProgress: true,
              ),
              iOS: const DarwinNotificationDetails(),
            ),
          );
        },
      );

      // Notificación de finalización
      await _notificationsPlugin.show(
        1,
        'Descarga completada',
        '$fileName\nGuardado en: $savePath',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'download_channel',
            'Descargas',
            channelDescription: 'Notificaciones de descarga',
            importance: Importance.low,
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );

      onComplete(savePath);
    } catch (e) {
      print('Error en descarga: $e');
      onError('Error al descargar: ${e.toString()}');
      // Notificación de error
      await _notificationsPlugin.show(
        2,
        'Error en descarga',
        'No se pudo descargar el archivo',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'download_channel',
            'Descargas',
            channelDescription: 'Notificaciones de descarga',
            importance: Importance.low,
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );
    }
  }

  Future<void> generateAndDownloadPDF({
    required String fileName,
    required Function(double) onProgress,
    required Function(String) onComplete,
    required Function(String) onError,
  }) async {
    try {
      print('Iniciando generación de PDF: $fileName');
      
      // Solicitar permisos
      final hasPermission = await _requestPermissions();
      if (!hasPermission) {
        print('Permiso denegado');
        onError('Permiso de almacenamiento denegado');
        return;
      }

      // Obtener directorio de descargas
      final downloadPath = await _getDownloadPath();
      if (downloadPath == null) {
        print('No se encontró ruta de descarga');
        onError('No se pudo obtener el directorio de descargas');
        return;
      }

      final savePath = '$downloadPath/$fileName';
      print('Guardando en: $savePath');

      // Crear directorio si no existe
      final dir = Directory(downloadPath);
      if (!await dir.exists()) {
        await dir.create(recursive: true);
        print('Directorio creado');
      }

      // Crear notificación inicial
      const AndroidNotificationDetails androidDetails = 
        AndroidNotificationDetails(
          'download_channel',
          'Descargas',
          channelDescription: 'Notificaciones de descarga',
          importance: Importance.low,
          progress: 0,
          maxProgress: 100,
          indeterminate: false,
          showProgress: true,
        );

      const DarwinNotificationDetails iosDetails = 
        DarwinNotificationDetails();

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _notificationsPlugin.show(
        0,
        'Generando',
        '$fileName',
        notificationDetails,
      );

      print('Iniciando simulación de progreso');
      
      // Simular generación de PDF con progreso
      for (int i = 0; i <= 100; i += 10) {
        await Future.delayed(const Duration(milliseconds: 300));
        final progress = i / 100.0;
        onProgress(progress);
        print('Progreso: $i%');

        // Actualizar notificación con progreso
        await _notificationsPlugin.show(
          0,
          'Generando',
          '$fileName',
          NotificationDetails(
            android: AndroidNotificationDetails(
              'download_channel',
              'Descargas',
              channelDescription: 'Notificaciones de descarga',
              importance: Importance.low,
              progress: i,
              maxProgress: 100,
              indeterminate: false,
              showProgress: true,
            ),
            iOS: const DarwinNotificationDetails(),
          ),
        );
      }

      // Crear archivo PDF simulado con contenido de texto
      final file = File(savePath);
      print('Creando archivo: $savePath');
      
      await file.writeAsString(
        'PDF Simulado - Constancia de Productor Cafetalero\n'
        'Este es un archivo de prueba generado por la aplicación AGRO.\n'
        'Fecha: ${DateTime.now()}\n'
        '---\n'
        'Esta presente constancia se expide a solicitud del interesado para los fines que considere pertinentes.\n'
      );

      print('Archivo creado exitosamente');

      // Verificar que el archivo existe
      final exists = await file.exists();
      print('Archivo existe: $exists');

      // Notificación de finalización
      await _notificationsPlugin.show(
        1,
        'Constancia generada',
        '$fileName\nGuardado en: $savePath',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'download_channel',
            'Descargas',
            channelDescription: 'Notificaciones de descarga',
            importance: Importance.low,
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );

      print('Generación completada');
      onComplete(savePath);
    } catch (e) {
      print('Error en generación de PDF: $e');
      print('Stack trace: ${StackTrace.current}');
      onError('Error al generar: ${e.toString()}');
      
      // Notificación de error
      await _notificationsPlugin.show(
        2,
        'Error en generación',
        'No se pudo generar el archivo',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'download_channel',
            'Descargas',
            channelDescription: 'Notificaciones de descarga',
            importance: Importance.low,
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );
    }
  }
}
