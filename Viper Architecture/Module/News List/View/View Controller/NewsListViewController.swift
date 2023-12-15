//
//  NewsListViewController.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import UIKit
import Alamofire

class NewsListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var presenter: NewsListViewToPresenterProtocol?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        presenter?.updateView()
        
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "NewsListTableViewCell", bundle: .main), forCellReuseIdentifier: "NewsListTableViewCell")
    }
}
// MARK: - UITableViewDataSource
extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNewsListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as? NewsListTableViewCell
        let row = indexPath.row
        let news = presenter?.getNewsList(at: row)
        
        guard let title = news?.title, let author = news?.author, let description = news?.description else {
            return cell ?? UITableViewCell()
        }
        
        cell?.setCell(title: title, author: author, description: description)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension NewsListViewController: UITableViewDelegate {}

// MARK: - LiveNewsListPresenterToViewProtocol
extension NewsListViewController: NewsListPresenterToViewProtocol {
    
    func showNewsList() {
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
