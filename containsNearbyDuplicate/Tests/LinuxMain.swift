import XCTest

import containsNearbyDuplicateTests

var tests = [XCTestCaseEntry]()
tests += containsNearbyDuplicateTests.allTests()
XCTMain(tests)