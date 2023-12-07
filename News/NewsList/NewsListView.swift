import UIKit

class NewsListViewController: UIViewController, NewsViewProtocol {
    var presenter: NewsPresenterProtocol?

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
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

         titleLabel.text = article.title
         descriptionLabel.text = article.description

         // Add titleLabel and descriptionLabel as subviews to the cell
         cell.contentView.addSubview(titleLabel)
         cell.contentView.addSubview(descriptionLabel)

         // Layout constraints for titleLabel
         NSLayoutConstraint.activate([
             titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
             titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
             titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8)
         ])

         // Layout constraints for descriptionLabel
         NSLayoutConstraint.activate([
             descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
             descriptionLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
             descriptionLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8),
             descriptionLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -8)
         ])

         return cell
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.articleSelected(at: indexPath.row)
    }
}
