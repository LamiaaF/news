//
//  NewsDetailsPresenter.swift
//  News
//
//  Created by Lamiaa on 2023-12-07.
//

import Foundation

class NewsDetailPresenter: NewsDetailPresenterProtocol, NewsDetailInteractorToPresenterProtocol {
    weak var view: NewsDetailViewProtocol?
    var interactor: NewsDetailInteractorProtocol?
    var router: NewsDetailRouterProtocol?

    // Add any additional properties needed for the details view

    func presentArticleDetail(for article: ArticleEntity) {
        interactor?.getArticleDetail(article: article)
    }

    // Implement NewsDetailInteractorToPresenterProtocol methods
    func articleDetailFetched(articleDetail: NewsDetailsEntity) {
        view?.showArticleDetail(articleDetail: articleDetail)
    }

    func articleDetailFetchFailed() {
        // Handle failure
    }
}
