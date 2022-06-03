//
//  HomeViewController.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var vwSearchContainer: UIView!
    @IBOutlet weak var vwTable: UITableView!

    var viewModel = HomeViewModel()


    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setViews()
        listenViewModel()
        fetchList()
    }
    
}

// MARK: - Data Fetch
extension HomeViewController {
    func fetchList() {
        let indicator = showActivityIndicator()
        viewModel.fetchList {
            DispatchQueue.main.async {
                self.hideActivityIndicator(indicator)
            }
        }
    }
}

// MARK: - UI updates
extension HomeViewController {
    func setViews() {
        vwSearchContainer.layer.borderColor = UIColor(named: "cl.border")?.cgColor
        vwTable.rowHeight = UITableView.automaticDimension
        vwTable.estimatedRowHeight = 500//UITableView.automaticDimension
    }
    
    func listenViewModel() {
        viewModel.itemsDidChange = { [weak self] newValue in
            DispatchQueue.main.async {
                self?.vwTable.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.viewModel.homeData?.count ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeData = self.viewModel.homeData![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: homeData.type.rawValue, for: indexPath) as! HomeTableViewCell
        cell.set(homeData: homeData)
        return cell
    }
    
    
}
