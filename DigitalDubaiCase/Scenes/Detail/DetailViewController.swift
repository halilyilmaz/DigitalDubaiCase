//
//  DetailViewController.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
import UIKit
import Combine
import MagazineLayout

final class DetailViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = .init()
    private let collectionView = CollectionView(style: .vertical)
    private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: ViewLifeCycle
    override func loadView() {
        super.loadView()
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.viewDidLoad()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        setupCollectionView()
    }
    
    private func setupConstraints() {
        collectionView.edges(to: view)
    }
    
    private func setupCollectionView() {
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(ArticleComponent.self)
        collectionView.register(EmptyComponent.self)
        collectionView.register(ArticleBodyComponent.self)
    }
    
    private func bind() {
        viewModel
            .$cellTypes
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cellTypes in
                guard let self = self else { return }
                self.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
}

// MARK: CollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = viewModel.cellTypes[indexPath.row]
        switch cellType {
        case .header:
            return articleCollectionViewCell(collectionView, indexPath: indexPath)
        case .body:
            return articleBodyCollectionViewCell(collectionView, indexPath: indexPath)
        }
    }
    
    private func articleCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> ArticleComponent {
        let articleCompoent = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ArticleComponent
        articleCompoent.configure(model: viewModel.articleComponentModel)
        return articleCompoent
    }
    
    private func articleBodyCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> ArticleBodyComponent {
        let articleBodyComponent = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ArticleBodyComponent
        articleBodyComponent.configure(model: viewModel.articleBodyComponentModel)
        return articleBodyComponent
    }
}

// MARK: MagazineLayout
extension DetailViewController: UICollectionViewDelegateMagazineLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeModeForItemAt indexPath: IndexPath) -> MagazineLayoutItemSizeMode {
        let cellType = viewModel.cellTypes[indexPath.row]
        switch cellType {
        case .header: return ArticleComponent.itemSizeMode()
        case .body: return ArticleBodyComponent.itemSizeMode()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForHeaderInSectionAtIndex index: Int) -> MagazineLayoutHeaderVisibilityMode {
        return .hidden
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForFooterInSectionAtIndex index: Int) -> MagazineLayoutFooterVisibilityMode {
        return .hidden
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForBackgroundInSectionAtIndex index: Int) -> MagazineLayoutBackgroundVisibilityMode {
        return .hidden
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, verticalSpacingForElementsInSectionAtIndex index: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, horizontalSpacingForItemsInSectionAtIndex index: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetsForSectionAtIndex index: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetsForItemsInSectionAtIndex index: Int) -> UIEdgeInsets {
        return .zero
    }
}
