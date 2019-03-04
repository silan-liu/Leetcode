import XCTest

import partitionLabelsTests

var tests = [XCTestCaseEntry]()
tests += partitionLabelsTests.allTests()
XCTMain(tests)