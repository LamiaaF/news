import UIKit

class NewsListViewController: UIViewController, NewsViewProtocol {
    var presenter: NewsPresenterProtocol?

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private var articles: [ArticleEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")

        title = "News"
        view.backgroundColor = .gray
        presenter = NewsPresenter()
        presenter?.view = self
        setupTableView()

        // Fetch news when the view loads
        presenter?.fetchNews()
    }

    private func setupTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // Implement the NewsViewProtocol methods
    func showNews(articles: [ArticleEntity]) {
        self.articles = articles
        tableView.reloadData()
    }

    func showError() {
        // Implement error handling if needed
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let article = articles[indexPath.row]

        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.description

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.articleSelected(at: indexPath.row)
    }
}
