import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(isPalindrome2Tests.allTests),
    ]
}
#endif