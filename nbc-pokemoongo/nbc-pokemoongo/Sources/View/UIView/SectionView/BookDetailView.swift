//
//  BookDetailView.swift
//  nbc-pokemoongo
//
//

import UIKit
import SnapKit
import RxCocoa
import Kingfisher


class BookDetailView: UIView, ModalLifecycleNotifiable, ModalCloseable {
    // MARK: - UIComponents & Properties
        
    let titleLabel = TitleLabel(size: .title1 , isBold: true)
    let authorLabel = BodyLabel()
    let contentsLabel = BodyLabel()
    let costLabel = TitleLabel()
    let coverImageView: BookCoverImageView
    let manageButton: CustomFilledButton
    let closeButton = CustomFilledButton(color: .disalbled, title: "X", isRounded: true)
    let scrollView = VerticalScrollView()
    
    let isCart: Bool
    let completion: () -> Void
    
    weak var delegate: ModalCloseDelegate?
    
    
    // MARK: - Life Cycles
    
    init(book: Book, isCart: Bool, completion: @escaping () -> Void = {}) {
        self.titleLabel.text = book.title
        self.authorLabel.text = book.authors.joined(separator: ", ")
        self.coverImageView = BookCoverImageView(imageUrl: book.thumbnail)
        self.costLabel.text = "\(book.price) 원"
        self.manageButton = CustomFilledButton(title: isCart ? "빼기" : "담기", isRounded: true)
        self.contentsLabel.text = book.contents
        self.isCart = isCart
        self.completion = completion
        
        super.init(frame: .zero)
        
        setupSubViews()
        setupUIProperties()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Layouts
extension BookDetailView {
    func setupSubViews() {
        [
            coverImageView,
            costLabel,
            contentsLabel
        ].forEach { scrollView.addSubview($0) }
        
        [
            titleLabel,
            authorLabel,
            scrollView,
            manageButton,
            closeButton
        ].forEach { addSubview($0) }
    }
    
    func setupUIProperties() {
        self.backgroundColor = Colors.appBackground
        
        titleLabel.textAlignment = .center
        titleLabel.setSystemColor(.r900)
        authorLabel.textAlignment = .center
        authorLabel.setTextColor(.gray)
        costLabel.textAlignment = .center
        costLabel.setSystemColor(.r700)
        
        contentsLabel.setLineSpacing(lineSpacing: Layouts.itemSpacing1)
        
        closeButton.applyButtonAction(action: closeModal)
    }
    
    func setupLayouts() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Layouts.paddingBig)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Layouts.itemSpacing2)
            make.leading.trailing.equalToSuperview().inset(Layouts.padding)
        }
        
        closeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(Layouts.bottomArea)
            make.leading.equalToSuperview().inset(Layouts.padding)
            make.width.equalTo(Layouts.buttonHeight)
        }
        
        manageButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(Layouts.bottomArea)
            make.leading.equalTo(closeButton.snp.trailing).offset(Layouts.itemSpacing1)
            make.trailing.equalToSuperview().inset(Layouts.padding)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(Layouts.itemSpacing7)
            make.leading.trailing.equalToSuperview().inset(Layouts.padding)
            make.bottom.equalTo(manageButton.snp.top).offset(Layouts.itemSpacing3)
        }
        
        coverImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(200)
        }
        
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(Layouts.itemSpacing2)
            make.leading.trailing.equalToSuperview()
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(costLabel.snp.bottom).offset(Layouts.itemSpacing5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}


// MARK: - Action

extension BookDetailView {
    func didTapButton() {
        
    }
}



// MARK: - Modal Porotocol Constraints

extension BookDetailView {
    func onModalWillAppear() {
        // 모달이 나타날 때 동작 추가
    }
    
    func onModalWillDisappear() {
        // 모달이 사라질 때 동작 추가
    }
    
    func closeModal() {
        completion()
        delegate?.closeModal()
    }
}
