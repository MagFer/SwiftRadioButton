//
//  ViewController.swift
//  SwiftRadioButton
//
//  Created by ian.magfer@gmail.com on 06/05/2019.
//  Copyright (c) 2019 ian.magfer@gmail.com. All rights reserved.
//

import UIKit
import SwiftRadioButton

class ViewController: UIViewController {
	
	var radioButtonGroup: RadioButtonGroup!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		radioButtonGroup = RadioButtonGroup(radioButtons: nil)
		
		let radioButton = RadioButton(frame: CGRect(x: 100, y: 140, width: 20, height: 20))
		view.addSubview(radioButton)
		
		let radioButton1 = RadioButton(frame: CGRect(x: 100, y: 270, width: 20, height: 20))
		view.addSubview(radioButton1)
		
		let radioButton2 = RadioButton(frame: CGRect(x: 100, y: 200, width: 20, height: 20))
		view.addSubview(radioButton2)
		
		radioButtonGroup = RadioButtonGroup(radioButtons: [radioButton, radioButton1, radioButton2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

