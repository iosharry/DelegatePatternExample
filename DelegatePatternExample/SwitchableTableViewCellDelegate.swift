//
//  SwitchableTableViewCellDelegate.swift
//  DelegatePatternExample
//
//  Created by gwangyonglee on 29/08/2019.
//  Copyright © 2019 gwangyonglee. All rights reserved.
//

import Foundation

protocol SwitchableTableViewCellDelegate: class {
	func valueChanged(_ isOn: Bool)
}
