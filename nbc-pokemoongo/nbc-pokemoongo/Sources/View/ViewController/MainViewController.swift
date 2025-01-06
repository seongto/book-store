//
//  ViewController.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources


class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let mainViewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    weak var coordinator : MainTabCoordinator?
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        getRecentBooks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
}


// MARK: - Bindings

extension MainViewController {
    func setupBindings() {
        // DataSource 설정
        let dataSource = RxCollectionViewSectionedReloadDataSource<BookSection>(
            configureCell: { dataSource, collectionView, indexPath, item in
                print("indexPath : \(indexPath[1])")
                if indexPath.section == 0 {
                    // Recent Books 섹션
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: RecentBookCell.id,
                        for: indexPath
                    ) as? RecentBookCell else { return UICollectionViewCell() }
                    cell.configure(with: item)
                    return cell
                } else {
                    // Search Results 섹션
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: BookSearchResultCell.id,
                        for: indexPath
                    ) as? BookSearchResultCell else { return UICollectionViewCell() }
                    cell.configure(with: item)
                    return cell
                }
                
            },
            configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: SectionHeaderView.id,
                    for: indexPath
                ) as? SectionHeaderView else { return UICollectionReusableView() }
                header.setTitle(dataSource.sectionModels[indexPath.section].header)
                return header
            }
        )
        
        // ViewModel의 bookSectionsRelay를 CollectionView에 바인딩
        mainViewModel.bookSectionsRelay
//            .map { sections in
//                sections.filter { !$0.items.isEmpty }
//            }
            .bind(to: mainView.bookCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        mainView.bookSearchBar.rx.text.orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(
                onNext: { [weak self] query in
                    self?.mainViewModel.fetchBooks(query: query)
                }
            ).disposed(by: disposeBag)
        
        mainView.bookCollectionView.rx.modelSelected(Book.self)
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] book in
                    self?.navigateToBookDetails(book: book)
                }
            ).disposed(by: disposeBag)
    }
}


// MARK: - Action Events

extension MainViewController {
    func getRecentBooks() {
        mainViewModel.refreshRecentBooks()
    }
    
    func navigateToBookDetails(book: Book) {
        guard let navigationController = self.navigationController else { return }

        coordinator?.navigateToDetail(with: book)
    }
}


// MARK: - Preview

@available(iOS 17.0, *)
#Preview {
    MainViewController()
}
