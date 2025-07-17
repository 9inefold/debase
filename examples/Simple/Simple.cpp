#include "Simple.hpp"
#include <DebaseAPI.hpp>
#include <cstdio>

NOINLINE A::~A() {
	__debase_dtor_begin();
  std::printf("A!\n");
	__debase_dtor_end();
}

NOINLINE B::~B() {
  std::printf("B!\n");
	debase::dtor_end();
}

NOINLINE C::~C() {
  std::printf("C!\n");
}
