import XCTest

import licenseKeyFormattingTests

var tests = [XCTestCaseEntry]()
tests += licenseKeyFormattingTests.allTests()
XCTMain(tests)