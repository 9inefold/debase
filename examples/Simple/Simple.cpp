#include "Simple.hpp"
#include <cstdio>

NOINLINE A::~A() {
  std::printf("A!\n");
}

NOINLINE B::~B() {
  std::printf("B!\n");
}

NOINLINE C::~C() {
  std::printf("C!\n");
}
