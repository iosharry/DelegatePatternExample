//
//  SwitchableTableViewCellTests.swift
//  DelegatePatternExampleTests
//
//  Created by gwangyonglee on 02/09/2019.
//  Copyright © 2019 gwangyonglee. All rights reserved.
//

import XCTest
@testable import DelegatePatternExample

class SwitchableTableViewCellTests: XCTestCase {
	
	var cell: SwitchableTableViewCell!

    override func setUp() {
        let bundle = Bundle(for: SwitchableTableViewCell.self)
		let nib = bundle.loadNibNamed(SwitchableTableViewCell.cellId, owner: nil, options: nil)
		cell = nib?.first as? SwitchableTableViewCell
    }

    override func tearDown() {
        cell = nil
    }
	
	func testSwitchableDelegate_whenValueChanged_isOn() {
		// given
		let mockDelegate = MockSwitchableTableViewCellDelegate()
		cell.delegate = mockDelegate
		
		// when
		cell.switch.sendActions(for: .valueChanged)
		
		// then
		XCTAssertEqual(mockDelegate.valueChangedCallCount, 1)
	}
}
