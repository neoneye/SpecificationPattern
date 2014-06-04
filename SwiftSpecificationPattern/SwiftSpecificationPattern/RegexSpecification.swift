//
// RegexSpecification
//
// Created by Simon Strandgaard on 04/06/14.
// Copyright (c) 2014 Simon Strandgaard. All rights reserved.
// MIT license.
//

import Foundation

class RegexSpecification: CompositeSpecification {
	let regex: NSRegularExpression
	
	init(regex: NSRegularExpression) {
		self.regex = regex
		super.init()
	}
	
	class func pattern(pattern: String) -> RegexSpecification {
		var error: NSError?
		var regex = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error:&error)
		assert(!error, "the regex pattern must always compile")
		return RegexSpecification(regex : regex)
	}
	
	override func isSatisfiedBy(candidate: AnyObject) -> Bool {
		if !(candidate is String) {
			return false
		}
		if let s = candidate as? String {
			return regex.numberOfMatchesInString(s, options: nil, range: NSMakeRange(0, countElements(s))) > 0
		}
		return false
	}
}
