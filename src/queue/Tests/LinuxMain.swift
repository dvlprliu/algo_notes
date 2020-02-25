import XCTest

import queueTests

var tests = [XCTestCaseEntry]()
tests += queueTests.allTests()
XCTMain(tests)
