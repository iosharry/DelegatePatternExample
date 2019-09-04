//
//  ViewController.swift
//  DelegatePatternExample
//
//  Created by gwangyonglee on 29/08/2019.
//  Copyright © 2019 gwangyonglee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IBOutlet
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var titleLabel: UILabel!
	
	// MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initTableView()
	}
	
	// MARK: - Init
	private func initTableView() {
		tableView.register(UINib(nibName: SwitchableTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: SwitchableTableViewCell.cellId)
	}
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchableTableViewCell.cellId, for: indexPath) as? SwitchableTableViewCell else { return UITableViewCell() }
		
		cell.delegate = self
		
		return cell
	}
}

// MARK: - SwitchableTableViewCellDelegate
extension ViewController: SwitchableTableViewCellDelegate {
	func valueChanged(_ isOn: Bool) {
		titleLabel.text = "Switch isOn -> \(isOn)"
	}
}
