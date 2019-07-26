import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(prefixesDivBy5Tests.allTests),
    ]
}
#endif
