#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


read -d '' fourLineTests <<-'EOF' || true
byKeyAsc: Return empty object
{}
byKeyAsc
{}

byKeyAsc: Return key-sorted object
{ "a": 2, "b": 1 }
byKeyAsc
{ "a": 2, "b": 1 }

byKeyAsc: Sort by key ascending
{ "b": 1, "a": 2 }
byKeyAsc
{ "a": 2, "b": 1 }

byKeyDesc: Return empty object
{}
byKeyDesc
{}

byKeyDesc: Sort by key descending
{ "b": 1, "a": 2 }
byKeyDesc
{ "b": 1, "a": 2 }

byKeyDesc: Return key-sorted object
{ "a": 2, "b": 1 }
byKeyDesc
{ "b": 1, "a": 2 }

byValueAsc: Return empty object
{}
byValueAsc
{}

byValueAsc: Return key-sorted object
{ "b": 1, "a": 2 }
byValueAsc
{ "b": 1, "a": 2 }

byValueAsc: Sort by key ascending
{ "a": 2, "b": 1 }
byValueAsc
{ "b": 1, "a": 2 }

byValueDesc: Return empty object
{}
byValueDesc
{}

byValueDesc: Sort by key descending
{ "a": 2, "b": 1 }
byValueDesc
{ "a": 2, "b": 1 }

byValueDesc: Return key-sorted object
{ "b": 1, "a": 2 }
byValueDesc
{ "a": 2, "b": 1 }
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
