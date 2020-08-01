import UIKit

class NikeView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    let searchController = UISearchController()
    let refreshControl = UIRefreshControl()

    var filtered: [NikeModel]?
    var data: [NikeModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reloadButton.target = self
        reloadButton.action = #selector(reloadData(_:))

        refreshControl.attributedTitle = NSAttributedString(string: "Loading Data", attributes: [.foregroundColor: UIColor.systemOrange])
        refreshControl.tintColor = .systemOrange
        refreshControl.addTarget(self, action: #selector(reloadData(_:)), for: .valueChanged)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.showsSearchResultsController = false
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl

        reloadData(refreshControl)
    }

    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filtered != nil ? filtered!.count : data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "nikeCell", for: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        #warning("WIP -> format data and display")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.isActive, let search = searchController.searchBar.searchTextField.text?.lowercased(), !search.isEmpty {
            filtered = data?.filter{ item -> Bool in
                item.title.lowercased().contains(search)
            }
        } else {
            filtered = nil
        }
    }
    
    @objc
    func reloadData(_ sender: Any) {
        reloadButton.isEnabled = false
        searchController.isActive = false
        searchController.searchBar.searchTextField.isEnabled = false
        
        data = []
        updateSearchResults(for: searchController)
        tableView.reloadData()
        
        #warning("WIP -> implement web scraping and parsing")
        data = [
            NikeModel(imageURL: "", title: "", price: "", sizes: ""),
            NikeModel(imageURL: "", title: "", price: "", sizes: ""),
            NikeModel(imageURL: "", title: "", price: "", sizes: ""),
            NikeModel(imageURL: "", title: "", price: "", sizes: "")
        ]

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.refreshControl.endRefreshing()
            self.reloadButton.isEnabled = true
            self.searchController.searchBar.searchTextField.isEnabled = true
            self.tableView.reloadData()
        }
    }
    
}

