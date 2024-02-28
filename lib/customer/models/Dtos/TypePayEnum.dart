enum TypePayEnum {
  Cash,
  Pocket,
  Esal,
  Online,
}

extension TypePayValue on TypePayEnum {
  int getValue() {
    switch (this) {
      case TypePayEnum.Cash:
        return 1;
      case TypePayEnum.Pocket:
        return 2;
      case TypePayEnum.Esal:
        return 3;
      default:
        return 4;
    }
  }
}
