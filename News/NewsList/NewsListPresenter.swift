// MARK: - NewsPresenter
import Foundation
import Alamofire

class NewsPresenter: NewsPresenterProtocol, NewsInteractorToPresenterProtocol {
    weak var view: NewsViewProtocol?
    var interactor: NewsInteractorProtocol?
    var router: NewsRouterProtocol?

    // Other properties and methods of your presenter...

    func fetchNews() {
        interactor?.getNews()
  }

    func newsFetched(newsEntity: NewsEntity) {
        view?.showNews(articles: newsEntity.articles)
    }

    func newsFetchFailed() {
        view?.showError()
    }

    func newrsFetchFailed() {
        // Implement this method to handle the case where the news fetching fails in a different context
        // For example, you might show a different error message or take alternative actions
        print("News fetching failed in a different context.")
    }

    func showArticleDetail(for article: ArticleEntity) {
        // Implement this method to navigate to the article detail screen
        router?.pushToArticleDetail(article: article)
    }

    func articleSelected(at index: Int) {
        interactor?.didSelectArticle(at: index)
    }
}
