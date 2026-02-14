#include <Class.hpp>

template <class T> void Test() {
  T* Ptr = new T();
  delete Ptr; 
}

int main() {
  Test<IClass>();
  Test<Class>();
  Test<ClassX>();
  Test<x::ns::Class>();
}
