# Release & Scalability Checklist

State as of 2026-10-23. The releases below assume the Flutter package in
`margadarshak/` and the layering rules from `AGENTS.md`.

## What is already verified

- [x] `flutter analyze` clean, `flutter test` 47/47 green.
- [x] Release APK (`flutter build apk --release --target-platform android-x64`,
      24.5 MB) installs and runs on the emulator, verified by adb screenshots:
      onboarding → 4-step profile quiz → home ranking → Schemes list →
      opportunity detail with source card, "Apply now", rule outcomes,
      document checklist, deadline rows.
- [x] Obfuscated AAB (`flutter build appbundle --release --obfuscate
      --split-debug-info=build\debug-info`, 44.5 MB fat ABI) builds.
- [x] Every opportunity record in the packs carries an `officialSourceUrl` +
      `lastVerifiedAt`; apply links and apply steps exist only where the
      portal was verified live against the official domain. Records without a
      verified apply path fall back to `officialSourceUrl` (`applyUri`
      extension) — never a fabricated link.

## Store release — remaining steps

1. **Signing key.** Generate an upload keystore (`keytool -genkey -v -keystore
   margadarshak-upload.keystore -alias upload -keyalg RSA -keysize 2048
   -validity 10000`), keep it out of git, put credentials in a local
   `margadarshak/android/key.properties` (gitignored), and wire the
   `signingConfigs.release` block in `android/app/build.gradle`.
2. **App icon + splash.** Replace the default launcher icon (adaptive icon for
   Android 8+; use `flutter_launcher_icons`), confirm the splash in
   `android/app/src/main/res/drawable*/launch_background.xml`.
3. **Version polish.** Decide `version:` in `pubspec.yaml`
   (`X.Y.Z+build`); bump the build number for every store upload.
4. **Store listing.** Screenshots for phone + 7"/10" tablet, 512×512 icon,
   localized store descriptions (en/hi/mr), data-safety form (the app stores
   name/class/district/income/category locally + optional Firebase account),
   target-audience and content descriptors.
5. **Play Console.** Upload the AAB, staged rollout to testers first; enable
   Play App Signing; add closed-track testers from partner schools to check
   real-world eligibility flows.
6. **Firebase (optional but recommended before launch).** Fill the
   `--dart-define` keys (`USE_FIREBASE`, `FIREBASE_*`) for a signed build, run
   `flutterfire configure` against the real project, commit nothing from it
   (no `firebase_options.dart`).

## Scalability — where to grow next

- **Remote data packs.** The packs are versioned JSON behind
  `OpportunityRepository`; publish a minor-versioned pack at a static URL and
  let a `NetworkOpportunityRepository` (same interface) refresh the Drift
  mirror, falling back to bundled assets offline.
- **Deadline reminders.** Records already expose `applicationClosesAt` (the
  UI shows "X days left"); add local scheduled notifications per saved
  opportunity (7/3/1 days) once the reminder service lands behind its
  interface.
- **Multi-state expansion.** Add `states/<code>/schemes.json` + an entry in
  the manifest `scopes.states` map; the loader, tests and UI pick it up with
  zero code changes. Do the same for new national pack files.
- **Content updates.** Every pack edit must re-run
  `dart run build_runner build` only when model classes change (not for JSON
  edits) — JSON asset edits need no codegen; keep
  `test/data/data_pack_test.dart` as the gatekeeper for source-URL +
  last-verified integrity.
- **CI.** Wire `flutter analyze`, `flutter test`,
  `flutter build apk --release` on every push; the obfuscated AAB only on
  main.
- **Telemetry with privacy.** The rule is: no phone numbers, student id only;
  add anonymous aggregate counters (pack version, failures per screen)
  behind a service interface with an offline/no-op implementation.
