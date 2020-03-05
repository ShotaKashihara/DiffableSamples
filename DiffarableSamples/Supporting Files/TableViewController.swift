import UIKit

class TableViewController: UITableViewController {
    public init() {
        super.init(style: .grouped)
        tableView.sectionHeaderHeight = 30
        tableView.sectionFooterHeight = 0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
