//
//  ViewController.swift
//  Basic_iOS
//
//  Created by Simon Strandgaard on 06/06/14.
//  Copyright (c) 2014 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
                            
	@IBOutlet weak var textField : UITextField!
	
	var validSpecification : Specification
	var partialSpecification : Specification
	
	init(coder aDecoder: NSCoder!) {
		validSpecification = ViewController.createValidSpecification()
		partialSpecification = ViewController.createPartialSpecification()
		super.init(coder: aDecoder)
	}
	
	init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
		validSpecification = ViewController.createValidSpecification()
		partialSpecification = ViewController.createPartialSpecification()
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	class func createValidSpecification() -> Specification {
		let spec0 = RegularExpressionSpecification.pattern("^taylor$")
		let spec1 = RegularExpressionSpecification.pattern("^swift$")
		return spec0.or(spec1)
	}
	
	class func createPartialSpecification() -> Specification {
		let spec0 = RegularExpressionSpecification.pattern("^t?a?y?l?o?r?$")
		let spec1 = RegularExpressionSpecification.pattern("^s?w?i?f?t?$")
		return spec0.or(spec1)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		textField.delegate = self
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		updateColorForText("")
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		textField.becomeFirstResponder()
	}

	func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
		if let originalText : NSString = textField.text {
			let newText = originalText.stringByReplacingCharactersInRange(range, withString: string)
			updateColorForText(String(newText))
		}
		return true
	}
	
	func updateColorForText(text: String?) {
		if text == nil {
			return
		}
		if validSpecification.isSatisfiedBy(text!) {
			textField.backgroundColor = UIColor.greenColor()
			return
		}
		if partialSpecification.isSatisfiedBy(text!) {
			textField.backgroundColor = UIColor.whiteColor()
			return
		}
		textField.backgroundColor = UIColor.redColor()
	}

}

