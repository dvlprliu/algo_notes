import XCTest

import LRUTests

var tests = [XCTestCaseEntry]()
tests += LRUTests.allTests()
XCTMain(tests)
