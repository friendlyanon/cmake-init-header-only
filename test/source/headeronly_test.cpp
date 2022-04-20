#include "headeronly/headeronly.hpp"

auto main() -> int
{
  auto const result = name();

  return result == "headeronly" ? 0 : 1;
}
