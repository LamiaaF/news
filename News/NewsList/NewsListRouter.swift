import UIKit

class NewsRouter: NewsRouterProtocol {
    static func createModule() -> UIViewController {
        let view = NewsListViewController()
        let presenter: NewsPresenterProtocol & NewsInteractorToPresenterProtocol = NewsPresenter()
        let interactor: NewsInteractorProtocol = NewsInteractor()
        let router: NewsRouterProtocol = NewsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }

    func pushToArticleDetail(article: ArticleEntity) {
        // ... your implementation
    }
}
