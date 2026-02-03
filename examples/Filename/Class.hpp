#pragma once

struct IClass {
  IClass() = default;
  virtual ~IClass();
};

struct Class : public IClass {
  Class();
  virtual ~Class();
};

struct ClassX : public Class {
  ClassX();
  virtual ~ClassX();
};

namespace x {
struct Class : public IClass {
  Class();
  virtual ~Class();
};
} // namespace x
