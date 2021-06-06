#include <headeronly/headeronly.hpp>

auto main() -> int
{
  auto result = name();
  return result == "headeronly" ? 0 : 1;
}
