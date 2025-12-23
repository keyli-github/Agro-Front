# Agro App 🚜

Agro App es una plataforma profesional de gestión agrícola construida con **Flutter**. El proyecto implementa una arquitectura robusta, escalable y con capacidad **Offline-First**.

## 🏗️ Arquitectura
El proyecto sigue los principios de **Clean Architecture** dividiendo las responsabilidades en:

- **Core**: Configuraciones globales, rutas y temas.
- **Features**: Módulos independientes por dominio (Inventario, Planes, Mercado, Comunidad).
- **Shared**: Componentes de UI reutilizables y utilidades comunes.

### Flujo de Datos
Se utiliza el patrón **Repository** combinado con **Streams**. La UI reacciona automáticamente a los cambios en la base de datos local (Isar) a través de Providers de Riverpod, garantizando una experiencia de usuario fluida sin estados intermedios inconsistentes.

## 🛠️ Stack Tecnológico
- **Estado**: [Riverpod 2.x](https://riverpod.dev/) con generación de código.
- **Base de Datos**: [Isar Community](https://isar.dev/) (NoSQL local de alto rendimiento).
- **Navegación**: [GoRouter](https://pub.dev/packages/go_router) con ShellRoutes.
- **Modelos**: [Freezed](https://pub.dev/packages/freezed) e Inmutabilidad.
- **UI**: Material 3 con Tematización Personalizada.

## 🚀 Instalación y Generación de Código
1. Obtener dependencias:
   ```bash
   flutter pub get