//
//  SwitchableTableViewCell.swift
//  DelegatePatternExample
//
//  Created by gwangyonglee on 29/08/2019.
//  Copyright © 2019 gwangyonglee. All rights reserved.
//

import UIKit

class SwitchableTableViewCell: UITableViewCell {

	// MARK: - IBOutlet
	@IBOutlet weak var `switch`: UISwitch!
	@IBOutlet weak var titleLabel: UILabel!
	
	// MARK: - Static Property
	static let cellId = "SwitchableTableViewCell"
	
	// MARK: - Property
	weak var delegate: SwitchableTableViewCellDelegate?
	
	// MARK: - Life Cycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	// MARK: - IBAction
	@IBAction func valueChangedSwitch(_ sender: UISwitch) {
		delegate?.valueChanged(sender.isOn)
	}
}
