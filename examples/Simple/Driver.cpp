#include <Simple.hpp>

template <class T> void Test() {
  T* Ptr = new T(0);
  delete Ptr; 
}

int main() {
  Test<A>();
  Test<B>();
  Test<C>();
  Test<E>();
}
