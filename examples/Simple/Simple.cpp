#include "Simple.hpp"
#include <debase/Annotations.hpp>
#include <cstdio>

NOINLINE A::A(int V) {
	__debase_ctor_begin();
  std::printf("A!\n");
	__debase_ctor_end();
}

NOINLINE B::B(int V) : A(V), x(V) {
  __debase_ctor_begin();
  std::printf("B!\n");
	__debase_ctor_end();
}

NOINLINE C::C(int V) : B(V), y(V, 'x') {
  __debase_ctor_begin();
  std::printf("C(%s)!\n", y.c_str());
	__debase_ctor_end();
}

NOINLINE E::E(int V) : A(V + 1), b(V) {
  __debase_ctor_begin();
  std::printf("E(%i)!\n", V);
	__debase_ctor_end();
}

NOINLINE A::~A() {
	__debase_dtor_begin();
  std::printf("~A!\n");
	__debase_dtor_end();
}

NOINLINE B::~B() {
	debase::dtor_begin();
  std::printf("~B!\n");
	debase::dtor_end();
}

NOINLINE C::~C() {
  std::printf("~C!\n");
  __debase_dtor_end();
}

NOINLINE E::~E() {
  __debase_dtor_begin();
  std::printf("~E!\n");
  __debase_dtor_end();
}
