enum InspectionResult {
  ok,
  notOk,
  partial,
}

extension InspectionResultX on InspectionResult {
  String get value {
    switch (this) {
      case InspectionResult.ok:
        return 'ok';
      case InspectionResult.notOk:
        return 'not_ok';
      case InspectionResult.partial:
        return 'partial';
    }
  }

  static InspectionResult from(String value) {
    switch (value) {
      case 'ok':
        return InspectionResult.ok;
      case 'not_ok':
        return InspectionResult.notOk;
      default:
        return InspectionResult.partial;
    }
  }
}
