//
//  RadioButtonsGroup.swift
//  Pods-SwiftRadioButton
//
//  Created by Ian Magarzo on 05/06/2019.
//

import Foundation
import UIKit

public protocol RadioButtonDelegate: class {
	func newRadioButtonSelected(radioButton: UIButton, atPosition: Int)
}

public class RadioButtonGroup {
	
	public weak var delegate: RadioButtonDelegate?
	private var radioButtons: [UIButton] = []
	public var color: UIColor = .gray
	
	public init(radioButtons: [UIButton]?) {
		if let initButtons = radioButtons, initButtons.count > 0 {
			self.radioButtons = initButtons
			for radioButton in self.radioButtons {
				radioButton.addTarget(self, action: #selector(hasBeingSelected(_:)), for: .touchUpInside)
			}
		}
	}
	
	public func addRadioButton(_ radioButton: UIButton) {
		radioButtons.append(radioButton)
		radioButton.addTarget(self, action: #selector(hasBeingSelected(_:)), for: .touchUpInside)
	}
	
	public func deleteRadioButton(_ radioButton: UIButton) {
		radioButtons.removeAll { (radioButtonInArray) -> Bool in
			radioButton == radioButtonInArray
		}
	}
	
	public func positionForRadioButton(_ radioButton: UIButton) -> Int? {
		for (index, element) in radioButtons.enumerated() {
			if element == radioButton {
				return index
			}
		}
		return nil
	}
	
	@objc func hasBeingSelected(_ selectedRadioButton: UIButton) {
		_ = radioButtons.compactMap { (radioButtonInArray) -> Void in
			guard selectedRadioButton != radioButtonInArray else {
				selectedRadioButton.isSelected = true
				selectedRadioButton.isUserInteractionEnabled = false
				delegate?.newRadioButtonSelected(radioButton: selectedRadioButton,
												 atPosition: self.positionForRadioButton(selectedRadioButton)!)
				return
			}
			radioButtonInArray.isSelected = false
			radioButtonInArray.isUserInteractionEnabled = true
		}
	}
	
}
