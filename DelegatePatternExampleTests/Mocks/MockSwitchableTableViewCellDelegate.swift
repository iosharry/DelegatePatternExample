//
//  MockSwitchableTableViewCellDelegate.swift
//  DelegatePatternExampleTests
//
//  Created by gwangyonglee on 02/09/2019.
//  Copyright © 2019 gwangyonglee. All rights reserved.
//

import Foundation
@testable import DelegatePatternExample

class MockSwitchableTableViewCellDelegate: SwitchableTableViewCellDelegate {
	var valueChangedCallCount = 0
	
	func valueChanged(_ isOn: Bool) {
		valueChangedCallCount += 1
	}
}
