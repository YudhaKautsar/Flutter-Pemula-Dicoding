# Project Guidance

- This is a beginner Flutter application; keep the UI and state management approachable.
- Keep business entities, repository contracts, and use cases in the offices domain layer.
- Keep office records and repository implementations in the offices data layer.
- Keep screens and reusable widgets in the offices presentation layer.
- Wire dependencies in `lib/main.dart`; pass use cases to presentation through constructors.
- Use Indonesian for visible app text.
- Run `flutter test` and `flutter analyze` after Dart changes when the Flutter SDK is available.