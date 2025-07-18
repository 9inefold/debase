#pragma once

#if defined(__GNUC__)
# define NOINLINE __attribute__((noinline))
#elif defined(_MSC_VER)
# define NOINLINE __declspec(noinline)
#endif

struct A {
  A() = default;
  virtual ~A();
};

struct B : public A {
  B() = default;
  virtual ~B();
};

struct C : public B {
  C() = default;
  NOINLINE virtual ~C();
};
