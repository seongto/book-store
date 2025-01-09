//
//  BottomSlideModalViewController.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit
import SnapKit


final class BottomSlideModalViewController: UIViewController, ModalCloseDelegate {
    // MARK: - Properties

    private let modalContentsView: UIView

    
    // MARK: - init & Life cyclesas

    init(modalContentsView: ModalCloseable ) {
        self.modalContentsView = modalContentsView as! UIView
        super.init(nibName: nil, bundle: nil)
        
        modalContentsView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTargetView()
    }
    
    /// 모달이 화면에 나타날 때 호출
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let targetView = modalContentsView as? ModalLifecycleNotifiable {
            targetView.onModalWillAppear()
        }
    }
    
    /// 모달이 사라질 때 호출
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let targetView = modalContentsView as? ModalLifecycleNotifiable {
            targetView.onModalWillDisappear()
        }
    }
}


// MARK: - Setup UI Layouts

extension BottomSlideModalViewController {
    private func setupTargetView() {
        view.addSubview(modalContentsView)
        view.backgroundColor = .white
        modalContentsView.translatesAutoresizingMaskIntoConstraints = false
        
        modalContentsView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.bottom.trailing.leading.equalToSuperview()
        }
    }
}


// MARK: - Action Management & Mapping

extension BottomSlideModalViewController {
    func closeModal() {
        self.dismiss(animated: true, completion: nil)
    }
}
