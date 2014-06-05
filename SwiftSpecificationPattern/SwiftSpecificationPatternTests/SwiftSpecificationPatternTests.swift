//
//  SwiftSpecificationPatternTests.swift
//  SwiftSpecificationPatternTests
//
//  Created by Simon Strandgaard on 04/06/14.
//  Copyright (c) 2014 None. All rights reserved.
//

import XCTest

class SwiftSpecificationPatternTests: XCTestCase {
    
	func testSimple() {
		let spec = RegexSpecification.pattern("^\\d+$")
		XCTAssertTrue(spec.isSatisfiedBy("123"))
		XCTAssertFalse(spec.isSatisfiedBy("abc"))
	}
	
	func testAdvanced() {
		/*
		 This specification checks these contraints
		 1. the string must be all digits
		 2. the string.length must be between 2..4
		 3. the string must not contain two zeroes
		 */
		let onlyDigits = RegexSpecification.pattern("^\\d*$")
		let between2And4Letters = RegexSpecification.pattern("^.{2,4}$")
		let twoZeroes = RegexSpecification.pattern("0.*0")
		let spec = onlyDigits.and(between2And4Letters).and(twoZeroes.not())
		XCTAssertTrue(spec.isSatisfiedBy("42"))
		XCTAssertTrue(spec.isSatisfiedBy("0123"))
		XCTAssertTrue(spec.isSatisfiedBy("666"))
		XCTAssertFalse(spec.isSatisfiedBy("ice"))
		XCTAssertFalse(spec.isSatisfiedBy("too long"))
		XCTAssertFalse(spec.isSatisfiedBy("00"))
		XCTAssertFalse(spec.isSatisfiedBy("1010"))
	}
	
	func testAnd() {
		let spec0 = RegexSpecification.pattern("^hello")
		let spec1 = RegexSpecification.pattern("world$")
		let spec = spec0.and(spec1)
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy("hello swift world"))
		XCTAssertFalse(spec.isSatisfiedBy("world hello"))
		XCTAssertFalse(spec.isSatisfiedBy("xyz hello world xzy"))
	}
	
	func testOr() {
		let spec0 = RegexSpecification.pattern("hello")
		let spec1 = RegexSpecification.pattern("world")
		let spec = spec0.or(spec1)
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy("hello"))
		XCTAssertTrue(spec.isSatisfiedBy("world"))
		XCTAssertFalse(spec.isSatisfiedBy("johndoe"))
	}
	
	func testNot() {
		let spec0 = RegexSpecification.pattern("hello")
		let spec = spec0.not()
		XCTAssertFalse(spec.isSatisfiedBy("hello"))
		XCTAssertTrue(spec.isSatisfiedBy("world"))
	}
	
}
