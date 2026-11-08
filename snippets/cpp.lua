local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("cptemplate", {
    t {
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "void solve() {",
      "    ",
    },
    i(0),
    t {
      "",
      "}",
      "",
      "int main() {",
      "    ios_base::sync_with_stdio(false);",
      "    cin.tie(NULL);",
      "    int t = 1;",
      "    cin >> t;",
      "    while (t--) solve();",
      "    return 0;",
      "}",
    },
  }),
}
