import XCTest

import heapTests

var tests = [XCTestCaseEntry]()
tests += heapTests.allTests()
XCTMain(tests)
