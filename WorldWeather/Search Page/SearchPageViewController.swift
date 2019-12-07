//
//  ViewController.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 5/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class SearchPageViewController: UIViewController {

    private static let cellID = "cellID"

    @IBOutlet weak var tableView: UITableView!

    var output: SearchPageInteractorInput?

    var cellVMs: [CitiesTableCellVM]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SearchPageConfigurator().configure(viewController: self)

        tableView.register(CitiesTableCell.self, forCellReuseIdentifier: SearchPageViewController.cellID)
    }
}

extension SearchPageViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellVMs?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchPageViewController.cellID, for: indexPath) as? CitiesTableCell else {
            return UITableViewCell()
        }

        cell.vm = cellVMs?[indexPath.row]

        return cell
    }
}

extension SearchPageViewController: SearchPagePresenterOutput {
    func displayRecentResults(vms: [CitiesTableCellVM]) {
        cellVMs = vms
    }

    func displaySearchResults(vms: [CitiesTableCellVM]) {
        cellVMs = vms
    }
}
