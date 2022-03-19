//
//  HomeViewController.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import UIKit
import Combine
import MagazineLayout
import Sheeeeeeeeet

final class HomeViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = .init()
    private let collectionView = CollectionView(style: .vertical)
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
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
        navigationItem.title = "Home"
        setupNavigationBar()
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(ArticleComponent.self)
        collectionView.register(EmptyComponent.self)
        collectionView.register(LoadingComponent.self)
    }
    
    private func setupNavigationBar() {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease"), style: .plain, target: self, action: #selector(presentSheet))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc private func presentSheet() {
        ActionSheetManager.makeActionSheetPeriodAndSection(self,
                                                           selectedPeriod: viewModel.selectedArticlePeriod,
                                                           selectedSection: viewModel.selectedArticleSection,
                                                           action: handleActionSheetSelectAction(sheet:menuItem:))
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
    
    private func handleActionSheetSelectAction(sheet: ActionSheet, menuItem: MenuItem) {
        if let buttonType = menuItem.value as? Sheeeeeeeeet.MenuButton.ButtonType, buttonType == .ok {
            let selectedItems = sheet.getSelectedItems()
            var selectedArticlePeriod = self.viewModel.selectedArticlePeriod
            var selectedArticleSection = self.viewModel.selectedArticleSection
            selectedItems.forEach { selectedItem in
                if let selectedPeriod = selectedItem.value as? PopularArticlePeriod {
                    selectedArticlePeriod = selectedPeriod
                } else if let selectedSection = selectedItem.value as? PopularArticleSection {
                    selectedArticleSection = selectedSection
                }
            }
            self.viewModel.loadMostPopularArticles(section: selectedArticleSection, period: selectedArticlePeriod)
        }
    }
}

// MARK: CollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = viewModel.cellTypes[indexPath.row]
        switch cellType {
        case .article:
            return articleCollectionViewCell(collectionView, indexPath: indexPath)
        case .loading:
            return loadingCollectionViewCell(collectionView, indexPath: indexPath)
        case .empty(let model):
            return emptyCollectionViewCell(collectionView, indexPath: indexPath, model: model)
        }
    }
    
    private func articleCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> ArticleComponent {
        let articleCompoent = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ArticleComponent
        let model = viewModel.articleComponentModels[indexPath.row]
        articleCompoent.configure(model: model)
        return articleCompoent
    }
    
    private func loadingCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> LoadingComponent {
        let loadingComponent = collectionView.dequeueReusableCell(forIndexPath: indexPath) as LoadingComponent
        loadingComponent.configure(model: LoadingComponentModel(isLoading: true))
        return loadingComponent
    }
    
    private func emptyCollectionViewCell(_ collectionView: UICollectionView, indexPath: IndexPath, model: EmptyComponentModel) -> UICollectionViewCell {
        let emptyComponent = collectionView.dequeueReusableCell(forIndexPath: indexPath) as EmptyComponent
        emptyComponent.configure(model: model)
        return emptyComponent
    }
}

// MARK: CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellType = viewModel.cellTypes[indexPath.row]
        switch cellType {
        case .article:
            viewModel.showArticle(indexPath: indexPath)
        case .loading: break
        case .empty: break
        }
    }
}

// MARK: MagazineLayout
extension HomeViewController: UICollectionViewDelegateMagazineLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeModeForItemAt indexPath: IndexPath) -> MagazineLayoutItemSizeMode {
        let cellType = viewModel.cellTypes[indexPath.row]
        switch cellType {
        case .article:
            return ArticleComponent.itemSizeMode()
        case .loading:
            return LoadingComponent.itemSizeMode()
        case .empty:
            return EmptyComponent.itemSizeMode()
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
