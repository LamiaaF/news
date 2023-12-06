import UIKit

// MARK: - View

protocol NewsViewProtocol: AnyObject {
    func showNews(articles: [ArticleEntity])
    func showError()
}

// MARK: - Presenter

protocol NewsPresenterProtocol: AnyObject {
    var view: NewsViewProtocol? { get set }
    var interactor: NewsInteractorProtocol? { get set }
    var router: NewsRouterProtocol? { get set }
    
    func fetchNews()
    func newsFetched(newsEntity: NewsEntity)
    func newsFetchFailed()
    func showArticleDetail(for article: ArticleEntity)
}

// MARK: - Interactor

protocol NewsInteractorProtocol: AnyObject {
    var presenter: NewsInteractorToPresenterProtocol? { get set }
    func getNews()
    func didSelectArticle(at index: Int)
}

// MARK: - InteractorToPresenterProtocol

protocol NewsInteractorToPresenterProtocol: AnyObject {
    func newsFetched(newsEntity: NewsEntity)
    func newsFetchFailed()
    func newrsFetchFailed()
    func articleSelected(at index: Int)
}

// MARK: - Router

protocol NewsRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func pushToArticleDetail(article: ArticleEntity)
}
