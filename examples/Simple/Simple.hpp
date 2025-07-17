#if !DISABLE_NOINLINE
# if defined(__GNUC__)
#  define NOINLINE __attribute__((noinline))
# elif defined(_MSC_VER)
#  define NOINLINE __declspec(noinline)
# endif
#endif
#ifndef NOINLINE
# define NOINLINE
#endif

struct A {
  A() = default;
  NOINLINE virtual ~A();
};

struct B : public A {
  B() = default;
  NOINLINE virtual ~B();
};

struct C : public B {
  C() = default;
  NOINLINE virtual ~C();
};
