enum OwnButtonType {
  primary,
  secondary,
  ghost;

  String get value {
    switch (this) {
      case primary:
        return 'primary';
      case secondary:
        return 'secondary';
      case ghost:
        return 'ghost';
    }
  }
}

enum OwnButtonSize {
  sm,
  md,
  lg;

  String get value {
    switch (this) {
      case sm:
        return 'sm';
      case md:
        return 'md';
      case lg:
        return 'lg';
    }
  }
}
