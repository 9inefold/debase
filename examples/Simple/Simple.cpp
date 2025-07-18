#include "Simple.hpp"
#include <debase/Annotations.hpp>
#include <cstdio>

A::~A() {
  __debase_dtor_begin();
  std::printf("A!\n");
  __debase_dtor_end();
}

B::~B() {
  std::printf("B!\n");
  debase::dtor_end();
}

NOINLINE C::~C() {
  std::printf("C!\n");
}
