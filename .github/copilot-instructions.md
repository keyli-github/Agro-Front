<!-- GitHub Copilot instructions for AI coding agents -->
# Repo-specific Copilot Instructions

These notes help AI coding agents be productive immediately in this Flutter + Riverpod app.

**Big Picture**
- **App type:** Flutter multi-platform app (Android/iOS/web/desktop). Entry: `lib/main.dart`.
- **State management:** `flutter_riverpod` (see `pubspec.yaml`). Providers and codegen (riverpod annotations) are used widely.
- **Routing:** `go_router` connected to Riverpod via `lib/core/router/app_router.dart`. The app uses a `ShellRoute` with a bottom navigation shell (`lib/shared/main_nav_shell.dart`).
- **Feature layout:** Feature-first structure under `lib/features/*/presentation/*_page.dart` (e.g., `lib/features/plan/presentation/plan_page.dart`). Keep changes scoped to a feature when possible.

**Important files to inspect before edits**
- `lib/main.dart` — app root, provider scope, `MaterialApp.router` wired to `routerProvider`.
- `lib/core/router/app_router.dart` — central route definitions; uses `@riverpod` and `part 'app_router.g.dart'` (codegen).
- `lib/shared/main_nav_shell.dart` — bottom navigation shell wrapping feature pages.
- `pubspec.yaml` — dependencies (GoRouter, Riverpod, Dio, build_runner).

**Code generation & build workflow**
- Riverpod and some generated router artifacts require running codegen after changing annotations:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

- Typical dev iteration: edit provider/route annotations → run the build_runner command above → run the app with `flutter run`.

**Patterns & conventions**
- Feature boundary: each feature lives under `lib/features/<feature>/` with `presentation`, `domain` and `data` subfolders where applicable.
- Use Riverpod providers for shared state; watch providers with `ref.watch(...)` in `ConsumerWidget`s (see `lib/main.dart`).
- Navigation: use `context.go('/path')` or `ref.read(routerProvider).go('/path')` consistent with GoRouter+Riverpod wiring.
- UI shell: avoid replacing the shell; add routes under `ShellRoute` in `app_router.dart` to keep bottom nav behavior intact.

**Networking & side effects**
- `dio` is declared in `pubspec.yaml` — look for a project-level HTTP client wrapper (search `dio` usages) and reuse it instead of creating ad-hoc clients.

**Testing & running**
- Run unit/widget tests with:

```bash
flutter test
```

- Run app locally (choose device/emulator):

```bash
flutter run -d <device-id>
```

**Editing router example**
- To add a new feature route:
  1. Add new page under `lib/features/<feature>/presentation/` (e.g., `my_feature_page.dart`).
  2. Add a `GoRoute` entry in `lib/core/router/app_router.dart` within the `ShellRoute` routes array.
  3. Run the build_runner command above if you touched annotated providers.

**What to avoid**
- Do not modify the shell keys or `MainNavShell` behavior without coordinating route changes — this can break bottom-nav navigation state.
- Avoid creating global singletons outside Riverpod; prefer providers so the app remains testable and reactively wired.

**Example quick checks for PRs**
- Verify `flutter analyze` passes and run `flutter test` for changed features.
- If you changed providers or annotations, ensure `app_router.g.dart` and other generated files are updated by running `build_runner`.

If anything in these notes is unclear or you'd like me to include additional hotspots (e.g., specific networking wrappers, authentication flows, or CI commands), tell me what to expand and I'll update this file.
