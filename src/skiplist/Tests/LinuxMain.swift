import XCTest

import skiplistTests

var tests = [XCTestCaseEntry]()
tests += skiplistTests.allTests()
XCTMain(tests)
