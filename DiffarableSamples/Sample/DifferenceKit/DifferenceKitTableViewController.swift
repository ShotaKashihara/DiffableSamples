import DifferenceKit

extension String: Differentiable {}

fileprivate enum Const {
    static let source = [
        ArraySection(model: "Section 1", elements: ["A", "B", "C"]),
        ArraySection(model: "Section 2", elements: ["D", "E", "F"]),
        ArraySection(model: "Section 3", elements: ["G", "H", "I"]),
        ArraySection(model: "Section 4", elements: ["J", "K", "L"])
    ]

    static let target = [
        ArraySection(model: "Section 5", elements: ["M", "N", "O"]),
        ArraySection(model: "Section 1", elements: ["A", "C"]),
        ArraySection(model: "Section 4", elements: ["J", "I", "K", "L"]),
        ArraySection(model: "Section 3", elements: ["G", "H", "Z"]),
        ArraySection(model: "Section 6", elements: ["P", "Q", "R"])
    ]
}

final class DifferenceKitTableViewController: TableViewController {
    public var dataInput: [ArraySection<String, String>] {
        get { return data }
        set {
            let changeset = StagedChangeset(source: data, target: newValue)
            tableView.reload(using: changeset, with: .fade) { data in
                self.data = data
            }
        }
    }
    private var data = [ArraySection<String, String>]()

    override func viewDidLoad() {
        dataInput = Const.source

        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] timer in
            self?.dataInput = Const.target
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
