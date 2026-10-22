# Margadarshak

Career guidance for rural and semi-urban Indian students — in Marathi and
Hindi, built around the village teacher as the guide.

A student speaks to the app in their own language and, in one sitting, gets
careers worth considering, what to study next, the scholarships and schemes
they actually qualify for with official links, and a checklist of documents to
collect. Five short daily clips and a streak-with-freeze keep them coming back.
The village teacher gets a class view to spot and recommend students, and can
publish modules of their own.

**The design choice that separates this from a chatbot:** the AI explains and
personalises, but eligibility is decided by rules against a source-linked
list, so it cannot invent a scheme and it refuses when nothing matches.

## Repository layout

| Path | What it is |
| --- | --- |
| `margadarshak/` | The Flutter application (single package) |
| `AGENTS.md` | How an agent should work in this repository |
| `.opencode/skills/`, `.claude/skills/`, `.agents/skills/`, `agent/skills/` | Installed Flutter/Dart agent skills |
| `skills-lock.json` | Pinned versions of those skills |

## Running the app

```powershell
cd margadarshak
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter run -d <emulator-id>
```

## Configuration

Everything external is behind an interface with an offline implementation, so
the app runs with no credentials at all. Flip to the real services with
`--dart-define`:

| Flag | Default | Purpose |
| --- | --- | --- |
| `USE_FIREBASE` | `false` | Use Firebase Auth + Firestore instead of the offline store |
| `FIREBASE_API_KEY` | `''` | Firebase web API key |
| `FIREBASE_APP_ID` | `''` | Firebase app id |
| `FIREBASE_PROJECT_ID` | `''` | Firebase project id |
| `FIREBASE_MESSAGING_SENDER_ID` | `''` | Firebase messaging sender id |
| `FIREBASE_AUTH_DOMAIN` | `''` | Firebase auth domain |
| `API_BASE_URL` | `''` | Base URL of the REST API for the data packs |
| `BHASHINI_BASE_URL` | `''` | Base URL of the Bhashini speech service |
| `LLM_BASE_URL` | `''` | Base URL of the explanation service |

```powershell
flutter run --dart-define=USE_FIREBASE=true --dart-define=FIREBASE_API_KEY=...
```

Without `USE_FIREBASE=true` the app signs the user in against a local session
file and keeps profile, progress and class data in Drift. The opportunity
data packs, the eligibility rules engine, the career catalogue and the daily
clips are always local — that is what makes the app work offline and what
makes "no fabricated schemes" enforceable.

## Data packs

```
margadarshak/assets/data/
  manifest.json                       version + which scopes ship
  national/schemes.json               national scholarships and schemes
  national/exams.json                 national examinations
  national/apprenticeships.json       national apprenticeships
  national/careers.json               the career catalogue
  national/clips.json                 the short learning clips
  states/maharashtra/schemes.json     the Maharashtra pack
  states/bihar/schemes.json           a second state, to show adding one is data
```

Every record carries an **official source URL** and a **last-verified date**.
A test (`test/data/data_pack_test.dart`) fails the build if one is missing.

Adding a state is a data task: drop a `states/<code>/schemes.json` in, list it
in `manifest.json`, and the app picks it up.

## Architecture

```
ui  →  domain  ←  data
```

* `lib/domain/` — immutable models, repository interfaces and the use cases.
  The eligibility rules engine, the career ranking, the daily queue, the
  streak, the document checklist and the explanation builder all live here as
  plain Dart, so they are fast and testable.
* `lib/data/` — the DTOs, the Drift database, the services (data packs, auth,
  user data, speech, LLM, HTTP) and the repository implementations.
* `lib/ui/` — `MVVM`: ViewModels extend `ChangeNotifier` and receive their
  dependencies through the constructor; Views only listen and render.

See `AGENTS.md` for the rules that govern changes here.

## Tests

```powershell
cd margadarshak
flutter test
```

* `test/domain/` — unit tests for every use case.
* `test/data/` — the data-pack integrity tests that keep the records honest.
* `test/widget_test.dart` — widget tests for the sign-in screen.

## Status

Milestone 1 is a vertical slice of all three flows (discover, learn and
opportunity, facilitator) plus the daily habit loop, with seeded data, the
real architecture and tests. A pilot target of 300 students, 15 facilitators
and 6 schools in one Maharashtra district is the next step.

No placement figures are claimed: the app reports applications started,
eligibility checks confirmed and verified outcomes, nothing more.
