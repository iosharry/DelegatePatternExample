# DelegatePatternExample
A Delegate Pattern Example With Unit Tests


## [Production Code]
#### Protocol Design 
```Swift
protocol SwitchableTableViewCellDelegate: class {
    func valueChanged(_ isOn: Bool)
}
```
---

#### Adopt the protocol
```Swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchableTableViewCell.cellId, for: indexPath) as? SwitchableTableViewCell else { return UITableViewCell() }
		
    cell.delegate = self
		
    return cell
}
```
---

#### Implementation of the adopted protocol
```Swift
extension ViewController: SwitchableTableViewCellDelegate {
    func valueChanged(_ isOn: Bool) {
        titleLabel.text = "Switch isOn -> \(isOn)"
    }
}
```
---

#### Stored protocol property & Event 
```Swift
weak var delegate: SwitchableTableViewCellDelegate?

@IBAction func valueChangedSwitch(_ sender: UISwitch) {
    delegate?.valueChanged(sender.isOn)
}
```
---

## [Unit Test]
#### Protocol Mocking
```Swift 
class MockSwitchableTableViewCellDelegate: SwitchableTableViewCellDelegate {
    var valueChangedCallCount = 0
	
    func valueChanged(_ isOn: Bool) {
        valueChangedCallCount += 1
    }
}

```
--- 

#### Dependency injection UITableViewCell
```Swift
let mockDelegate = MockSwitchableTableViewCellDelegate()
cell.delegate = mockDelegate
```
---

#### Event Test
```Swift
func testSwitchableDelegate_whenValueChanged_isOn() {
    // given
    let mockDelegate = MockSwitchableTableViewCellDelegate()
    cell.delegate = mockDelegate
		
    // when
    cell.switch.sendActions(for: .valueChanged)
		
    // then
    XCTAssertEqual(mockDelegate.valueChangedCallCount, 1)
}
```
