//
//  BookCartViewController.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class BookCartViewController: UIViewController {
    // MARK: - Properties
    
    private let bookCartView = BookCartView()
    private let bookCartViewModel = BookCartViewModel()
    private let disposeBag = DisposeBag()
    
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        self.view = bookCartView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

}


// MARK: - Bindings

extension BookCartViewController {
    func setupBindings() {
        bookCartView.cartCollectionView.rx.modelSelected(Book.self)
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { book in
                    ModalManager.createBottomSlideModal(content: BookDetailView(book: book, isCart: true))
                }
            ).disposed(by: disposeBag)
    }
}


