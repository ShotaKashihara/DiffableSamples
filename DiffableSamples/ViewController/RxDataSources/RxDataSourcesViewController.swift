import RxSwift
import RxRelay
import RxDataSources

final class RxDataSourcesViewController: T2ableViewController {

    let sections: BehaviorRelay<[MySection]> = .init(value: RxDataSources.source)
    let disposeBag = DisposeBag()
    var dataSource: RxTableViewSectionedAnimatedDataSource<MySection>?

    override func viewDidLoad() {
        setupTableView()
        let dataSource = RxTableViewSectionedAnimatedDataSource<MySection>(
            animationConfiguration: .init(
                insertAnimation: .fade,
                reloadAnimation: .fade,
                deleteAnimation: .fade
            ),
            configureCell: { dataSource, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
                cell.textLabel?.text = item
                return cell
            },
            titleForHeaderInSection: { dataSource, index in
                return dataSource.sectionModels[index].header
            }
        )

        self.dataSource = dataSource

        sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] _ in
            self?.sections.accept(RxDataSources.target)
        }
    }
}
