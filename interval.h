#ifndef INTERVAL_H
#define INTERVAL_H

#include <limits>

class interval {
public:
  double min, max;

  interval()
      : min(std::numeric_limits<double>::infinity()),
        max(-std::numeric_limits<double>::infinity()) {}
  interval(double min, double max) : min(min), max(max) {}

  bool contains(double x) const { return min <= x && x <= max; }
  bool surrounds(double x) const { return min < x && x < max; }

  static const interval empty, universe;
};

const static interval empty(std::numeric_limits<double>::infinity(),
                            -std::numeric_limits<double>::infinity());
const static interval universe(-std::numeric_limits<double>::infinity(),
                               std::numeric_limits<double>::infinity());

#endif