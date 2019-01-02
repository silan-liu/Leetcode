import XCTest

import repeatedStringMatchTests

var tests = [XCTestCaseEntry]()
tests += repeatedStringMatchTests.allTests()
XCTMain(tests)