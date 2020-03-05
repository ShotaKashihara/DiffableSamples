import UIKit

extension SampleViewController {
    enum RowType: Int, CaseIterable {
        case differenceKit
        case rxDataSources
        case apple

        var title: String {
            switch self {
            case .differenceKit:
                return "ra1028/DifferenceKit"
            case .rxDataSources:
                return "RxSwiftCommunity/RxDataSources"
            case .apple:
                return "🚧 Apple/Diffable Data Sources (~> iOS 13) 🚧"
            }
        }

        var viewController: UIViewController {
            switch self {
            case .differenceKit:
                return DifferenceKitTableViewController()
            case .rxDataSources:
                return RxDataSourcesViewController()
            case .apple:
                return UITableViewDiffableDataSourceViewController()
            }
        }
    }
}
