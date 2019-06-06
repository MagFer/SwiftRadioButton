//
//  RadioButton.swift
//  Pods-SwiftRadioButton
//
//  Created by Ian Magarzo on 05/06/2019.
//

import Foundation
import UIKit

public class RadioButton: UIButton {
	
	var auxSelection = false
	
	public convenience init(selected: UIImage, nonSelected: UIImage) {
		self.init(frame: .zero)
		setImage(selected, for: .selected)
		setImage(nonSelected, for: .normal)
		adjustsImageWhenHighlighted = false
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		
		let frameworkBundle = Bundle(for: type(of: self))
		let checkboxImgEmpty = UIImage(named: "radio_empty.pdf" ,in: frameworkBundle, compatibleWith: nil)
		let checkboxImgFilled = UIImage(named: "radio_filled.pdf", in: frameworkBundle, compatibleWith: nil)
		
		setImage(checkboxImgFilled, for: .selected)
		setImage(checkboxImgEmpty, for: .normal)
		
		adjustsImageWhenHighlighted = false
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private var isFirstTimeLayoutSubviews = true
	override public func layoutSubviews() {
		if isFirstTimeLayoutSubviews {
			self.didLoad()
			isFirstTimeLayoutSubviews = false
		}
		super.layoutSubviews()
	}
	
	public func didLoad() {
		backgroundColor = .clear
		self.isHighlighted = false
	}
	
}
