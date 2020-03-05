import DifferenceKit

final class DifferenceKitTableViewController: TableViewController {
    private var data = [ArraySection<String, String>]()
    public var dataInput: [ArraySection<String, String>] {
        get { return data }
        set {
            let changeset = StagedChangeset(source: data, target: newValue)
            tableView.reload(using: changeset, with: .fade) { data in
                self.data = data
            }
        }
    }

    override func viewDidLoad() {
        dataInput = DifferenceKit.source

        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] timer in
            self?.dataInput = DifferenceKit.target
        }
    }
}

/// UITableViewDataSource
extension DifferenceKitTableViewController {
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].elements.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = data[indexPath.section].elements[indexPath.row]
        return cell
    }

    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].model
    }
}
