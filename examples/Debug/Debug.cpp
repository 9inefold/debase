#include "Debug.hpp"
#include <debase/Annotations.hpp>
#include <cstdio>

IDebug::IDebug() = default;
IDebug::~IDebug() {
  __debase_dtor_begin();
  std::printf("~IDebug!\n");
  __debase_dtor_end();
}
void IDebug::foo() {}

Debug::Debug() {
  __debase_ctor_begin();
  // ...
  __debase_ctor_end();
}
Debug::~Debug() {
  __debase_dtor_begin();
  std::printf("~Debug!\n");
  __debase_dtor_end();
}
void Debug::foo() {}
