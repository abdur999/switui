#  <#Title#>

To implement Clean Architecture with MVVM using UIKit in Swift, we will break down the app into distinct layers:

Presentation Layer (UI and ViewModel)
Domain Layer (Business logic)
Data Layer (Networking and Data Management)
Project Structure:
Presentation: View and ViewModel
Domain: Use cases and models (pure business logic)
Data: Repositories, network services, and data mappers

To implement Clean Architecture with MVVM using UIKit in Swift, we will break down the app into distinct layers:

Presentation Layer (UI and ViewModel)
Domain Layer (Business logic)
Data Layer (Networking and Data Management)
Project Structure:
Presentation: View and ViewModel
Domain: Use cases and models (pure business logic)
Data: Repositories, network services, and data mappers
1. Model (Domain Layer):
The Item model represents the data we will work with. It contains basic properties like id, title, and description.

// Domain Layer - Item.swift
struct Item: Codable {
    let id: Int
    let title: String
    let description: String
}
2. Use Case (Domain Layer):
The use case layer defines the business logic. In this case, it fetches the list of items from the data layer.

// Domain Layer - FetchItemsUseCase.swift
import Foundation

protocol FetchItemsUseCaseProtocol {
    func execute(completion: @escaping (Result<[Item], Error>) -> Void)
}

class FetchItemsUseCase: FetchItemsUseCaseProtocol {
    private let repository: ItemRepositoryProtocol
    
    init(repository: ItemRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[Item], Error>) -> Void) {
        repository.fetchItems(completion: completion)
    }
}
3. Repository (Data Layer):
The repository will abstract data sources (network calls, databases, etc.). In our case, we'll implement the network layer to fetch items from an API.

// Data Layer - ItemRepository.swift
import Foundation

protocol ItemRepositoryProtocol {
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void)
}

class ItemRepository: ItemRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        networkService.fetchItems(completion: completion)
    }
}
4. Network Service (Data Layer):
This service will handle all networking logic. It will fetch the data from an API.

// Data Layer - NetworkService.swift
import Foundation

protocol NetworkServiceProtocol {
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        guard let url = URL(string: "https://api.example.com/items") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data Error", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let items = try JSONDecoder().decode([Item].self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
5. ViewModel (Presentation Layer):
The ViewModel will be responsible for interacting with the use case to fetch data and provide it to the View (ViewController). It also exposes data-binding methods for UI updates.

// Presentation Layer - ItemListViewModel.swift
import Foundation

protocol ItemListViewModelProtocol {
    var numberOfItems: Int { get }
    func item(at index: Int) -> Item
    func fetchItems()
    var onUpdate: (() -> Void)? { get set }
}

class ItemListViewModel: ItemListViewModelProtocol {
    private var items: [Item] = []
    private let fetchItemsUseCase: FetchItemsUseCaseProtocol
    
    var onUpdate: (() -> Void)?
    
    var numberOfItems: Int {
        return items.count
    }
    
    init(fetchItemsUseCase: FetchItemsUseCaseProtocol) {
        self.fetchItemsUseCase = fetchItemsUseCase
    }
    
    func fetchItems() {
        fetchItemsUseCase.execute { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
            case .failure(let error):
                print("Error fetching items: \(error)")
            }
            
            DispatchQueue.main.async {
                self?.onUpdate?()
            }
        }
    }
    
    func item(at index: Int) -> Item {
        return items[index]
    }
}
6. ViewController (Presentation Layer):
The ItemListViewController will use the ItemListViewModel to bind the data and handle user interactions.

// Presentation Layer - ItemListViewController.swift
import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel: ItemListViewModelProtocol!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
        
        viewModel.fetchItems()
    }
    
    func setupViewModel() {
        let networkService = NetworkService()
        let repository = ItemRepository(networkService: networkService)
        let fetchItemsUseCase = FetchItemsUseCase(repository: repository)
        viewModel = ItemListViewModel(fetchItemsUseCase: fetchItemsUseCase)
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // TableView DataSource and Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = viewModel.item(at: indexPath.row)
        cell.textLabel?.text = item.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.item(at: indexPath.row)
        let detailsVC = ItemDetailsViewController(item: item)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
7. Details ViewController (Presentation Layer):
The ItemDetailsViewController displays the details of the selected item.

// Presentation Layer - ItemDetailsViewController.swift
import UIKit

class ItemDetailsViewController: UIViewController {
    
    private let item: Item
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = item.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = item.description
        descriptionLabel.numberOfLines = 0
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}
8. App Delegate:
Setting up the root view controller with a navigation controller.

// AppDelegate.swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: ItemListViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
Clean Architecture Principles in Action:
Separation of Concerns: Each layer (Presentation, Domain, Data) has a clear responsibility.
Presentation: Deals with UI and user interaction.
Domain: Contains business logic, such as fetching and processing data.
Data: Handles network requests and local data management.
Dependency Injection: Dependencies (like network services, repositories, etc.) are injected into the relevant classes, making the code more modular, testable, and flexible.
Use Cases: FetchItemsUseCase represents the core logic and is independent of how data is fetched, making it easier to test and modify.
Testable: Each component is decoupled, which makes testing more straightforward. You can easily mock dependencies in unit tests.
