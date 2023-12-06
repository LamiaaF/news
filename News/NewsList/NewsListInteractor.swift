import Foundation

class NewsInteractor: NewsInteractorProtocol {
    var presenter: NewsInteractorToPresenterProtocol?
    
    private var newsEntity: NewsEntity?

    func getNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=YOUR_API_KEY") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.presenter?.newsFetchFailed()
                return
            }

            do {
                let decoder = JSONDecoder()
                let newsEntity = try decoder.decode(NewsEntity.self, from: data)
                self.newsEntity = newsEntity
                self.presenter?.newsFetched(newsEntity: newsEntity)
            } catch {
                self.presenter?.newrsFetchFailed()
            }
        }

        task.resume()
    }

    func didSelectArticle(at index: Int) {
        guard let selectedArticle = newsEntity?.articles[index] else {
            return
        }
        presenter?.articleSelected(at: index)
    }
}
