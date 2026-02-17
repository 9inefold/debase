#pragma once

class IDebug {
public:
  IDebug();
  virtual ~IDebug();
  virtual void foo();
};

class Debug : public IDebug {
public:
  Debug();
  ~Debug() override;
  void foo() override;
};
