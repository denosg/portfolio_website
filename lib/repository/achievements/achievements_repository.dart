class AchievementsRepository {
  double getHeight(double? width, double? height) {
    if (width != null) {
      return width * 1.77;
    }
    return height!;
  }

  double getWidth(double? width, double? height) {
    if (height != null) {
      return height * 0.565;
    }
    return width!;
  }
}
