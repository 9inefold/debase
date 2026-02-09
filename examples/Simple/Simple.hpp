#pragma once

#include <string>

#if defined(__GNUC__)
# define NOINLINE __attribute__((noinline))
#elif defined(_MSC_VER)
# define NOINLINE __declspec(noinline)
#endif

struct A {
  A() = default;
  NOINLINE A(int V);
  NOINLINE virtual ~A();
};

struct B : public A {
  int x = 0;
  B() = default;
  NOINLINE B(int V);
  NOINLINE virtual ~B();
};

struct E : public A {
  B b;
  E() = default;
  NOINLINE E(int V);
  NOINLINE virtual ~E();
};

struct C : public B, public E {
  std::string y;
  C() = default;
  NOINLINE C(int V);
  NOINLINE virtual ~C();
};
