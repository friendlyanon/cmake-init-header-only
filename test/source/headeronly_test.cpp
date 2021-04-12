#include <headeronly/headeronly.h>

int main() {
  auto result = name();
  return result == "headeronly" ? 0 : 1;
}
