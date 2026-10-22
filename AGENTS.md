# AGENTS.md

Guidance for coding agents working in this repository.

## What this repository is

`Margadarshak` is a career-guidance app for rural and semi-urban Indian
students (Class 9 to graduation), starting in Maharashtra, in Marathi and
Hindi. It links a student profile to careers worth considering, the next study
step, and the scholarships, schemes, examinations and apprenticeships they
actually qualify for — each with an official source link and a last-verified
date.

The product promise that constrains every change:

> The AI explains and personalises, but **eligibility is decided by rules
> against a source-linked list**, so it cannot invent a scheme and it refuses
> when nothing matches.

Never weaken that. Any change that lets the app *say* something without a
verified record behind it is a regression, not a feature.

## Layout

```
margadarshak/          the Flutter application
  lib/
    app/               bootstrap, dependency injection, router, session
    core/              Result/Failure, config, logging, date helpers
    data/              models (DTOs), local (Drift), services, repositories
    domain/            models, repository interfaces, use cases
    ui/                core (theme, widgets, l10n) + features/<name>/
    l10n/              app_en.arb, app_hi.arb, app_mr.arb
  assets/data/         the versioned data packs
  test/                unit tests, widget tests, data-pack integrity tests
```

The app folder is a **single Flutter package**; the repository root also holds
agent skills and documentation, but no other Dart package.

## The layers and how they may depend on each other

```
ui  →  domain  ←  data
```

* `ui/` may import `domain/` and `core/`. It must never import `data/`.
* `domain/` may import `core/` only. It must never import `data/`, Flutter
  widgets, or any package that talks to a device.
* `data/` implements the interfaces declared in `domain/repositories/`.
* `core/` may be imported by everyone and imports nothing of ours.

A ViewModel extends `ChangeNotifier`, receives its repositories and use cases
through the constructor, exposes immutable state and command methods, and never
touches a service directly. A View listens with `ListenableBuilder` or
`context.watch`, and holds no business logic.

## Rules that are not negotiable

1. **Eligibility is pure Dart.** The rules live in
   `domain/use_cases/evaluate_eligibility.dart` and are decided by data in the
   packs. No model call, no network call, no randomness.
2. **Every opportunity record has an official source URL and a
   `lastVerifiedAt` date.** `test/data/data_pack_test.dart` enforces this.
3. **External services sit behind an interface** with an offline
   implementation and a real adapter, chosen by configuration:
   `AuthService`, `UserDataService`, `SpeechService`, `LlmService`,
   `OpportunityRepository`.
4. **Local-first.** The JSON data packs ship in the app; Drift is the local
   source of truth; Firebase is optional and only carries small user-scoped
   data.
5. **Marathi and Hindi are first-class.** Every user-facing string lives in
   `lib/l10n/app_*.arb`. Never hard-code a string in a widget.
6. **Privacy.** Identify students by a student id, not a phone number. Collect
   only the fields the eligibility rules need.

## Working commands

```powershell
cd margadarshak
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # after model changes
flutter gen-l10n                                          # after ARB changes
flutter analyze                                           # must be clean
flutter test
flutter run -d <emulator-id>
```

`build_runner` must be re-run whenever a `freezed`, `json_serializable` or
`drift` annotated class changes. Generated files (`*.g.dart`,
`*.freezed.dart`) are never edited by hand.

## Adding a feature

1. Model the data in `domain/models/` with `freezed` (immutable, `fromJson`).
2. Add the use case in `domain/use_cases/` and unit test it.
3. Add or extend a repository interface in `domain/repositories/repositories.dart`
   and implement it in `data/repositories/`.
4. Add the ViewModel in `ui/features/<name>/view_models/` and the screens in
   `ui/features/<name>/views/`.
5. Register the new dependency in `app/dependency_injection.dart`.
6. Register the route in `app/router.dart`.
7. Add the strings to all three ARB files.
8. Run the commands above.

## Testing expectations

* Every use case gets unit tests in `test/domain/`.
* Anything that touches a data pack gets a test in `test/data/`.
* Screens get widget tests in `test/` using a fake repository, never a real
  network call.
