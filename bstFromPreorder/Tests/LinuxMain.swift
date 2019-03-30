import XCTest

import bstFromPreorderTests

var tests = [XCTestCaseEntry]()
tests += bstFromPreorderTests.allTests()
XCTMain(tests)