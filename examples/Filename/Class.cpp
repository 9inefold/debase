#include "Class.hpp"
#include <debase/Annotations.hpp>
#include <cstdio>

namespace {
struct ClassAnon : public ClassX {
  ClassAnon();
  virtual ~ClassAnon();
};
} // namespace `anonymous`

Class::Class() : IClass() {
  __debase_ctor_begin();
  std::printf("Class!\n");
  __debase_ctor_end();
}

ClassX::ClassX() : Class() {
  __debase_ctor_begin();
  std::printf("ClassX!\n");
  __debase_ctor_end();
}

x::ns::Class::Class() : IClass() {
  __debase_ctor_begin();
  std::printf("x::ns::Class!\n");
  __debase_ctor_end();
}

ClassAnon::ClassAnon() : ClassX() {
  __debase_ctor_begin();
  std::printf("Class`anonymous`!\n");
  __debase_ctor_end();
}

IClass::~IClass() {
  std::printf("~IClass!\n");
}

Class::~Class() {
  __debase_dtor_begin();
  std::printf("~Class!\n");
  __debase_dtor_end();
}

ClassX::~ClassX() {
  __debase_dtor_begin();
  std::printf("~ClassX!\n");
  __debase_dtor_end();
}

x::ns::Class::~Class() {
  __debase_dtor_begin();
  std::printf("~x::ns::Class!\n");
  __debase_dtor_end();
}

ClassAnon::~ClassAnon() {
  __debase_dtor_begin();
  std::printf("~Class`anonymous`!\n");
  __debase_dtor_end();
}

extern IClass* getClass() {
  return new ClassAnon();
}

extern void deleteClass(IClass*& clazz) {
  delete clazz;
  clazz = nullptr;
}
