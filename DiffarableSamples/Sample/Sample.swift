import UIKit

extension SampleViewController {
    enum RowType: Int, CaseIterable {
        case differenceKit

        var title: String {
            switch self {
            case .differenceKit:
                return "ra1028/DifferenceKit"
            }
        }

        var viewController: UIViewController {
            switch self {
            case .differenceKit:
                return DifferenceKitTableViewController()
            }
        }
    }
}
