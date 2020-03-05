/// MARK: - DifferenceKit

import DifferenceKit

extension String: Differentiable {}

enum DifferenceKit {
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

/// MARK: - RxDataSources

import RxDataSources

enum RxDataSources {
    static let source = [
        MySection(header: "Section 1", items: ["A", "B", "C"]),
        MySection(header: "Section 2", items: ["D", "E", "F"]),
        MySection(header: "Section 3", items: ["G", "H", "I"]),
        MySection(header: "Section 4", items: ["J", "K", "L"])
    ]

    static let target = [
        MySection(header: "Section 5", items: ["M", "N", "O"]),
        MySection(header: "Section 1", items: ["A", "C"]),
        MySection(header: "Section 4", items: ["J", "I", "K", "L"]),
        MySection(header: "Section 3", items: ["G", "H", "Z"]),
        MySection(header: "Section 6", items: ["P", "Q", "R"])
    ]
}

struct MySection {
    var header: String
    var items: [Item]
}

extension MySection : AnimatableSectionModelType {
    typealias Item = String

    var identity: String {
        return header
    }

    init(original: MySection, items: [Item]) {
        self = original
        self.items = items
    }
}

/// MARK: - Apple

enum Apple {
    static let source = [
        AppleSection(section: "Section 1", items: ["A", "B", "C"]),
        AppleSection(section: "Section 2", items: ["D", "E", "F"]),
        AppleSection(section: "Section 3", items: ["G", "H", "I"]),
        AppleSection(section: "Section 4", items: ["J", "K", "L"])
    ]

    static let sourceSnapShot: NSDiffableDataSourceSnapshot<String, String> = {
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(Apple.source.map { $0.section })
        Apple.source.forEach {
            snapshot.appendItems($0.items, toSection: $0.section)
        }
        return snapshot
    }()

    static let target = [
        AppleSection(section: "Section 5", items: ["M", "N", "O"]),
        AppleSection(section: "Section 1", items: ["A", "C"]),
        AppleSection(section: "Section 4", items: ["J", "I", "K", "L"]),
        AppleSection(section: "Section 3", items: ["G", "H", "Z"]),
        AppleSection(section: "Section 6", items: ["P", "Q", "R"])
    ]

    static let targetSnapShot: NSDiffableDataSourceSnapshot<String, String> = {
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(Apple.target.map { $0.section })
        Apple.target.forEach {
            snapshot.appendItems($0.items, toSection: $0.section)
        }
        return snapshot
    }()
}

struct AppleSection {
    let section: String
    let items: [String]
}
