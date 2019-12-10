//
//  ViewController.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 5/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

class SearchPageViewController: UIViewController {

    static let cellID = "cellID"
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadIndicator: LoadIndicator!
    var output: SearchPageInteractorInput?

    var router: SearchPagePageRouterProtocol?

    // view model for the view
    var vm: SearchPageViewModel? {
        didSet {
            title = vm?.title
            searchField.placeholder = vm?.searchBarPlaceholder
            searchField.text = vm?.searchBarText
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SearchPageConfigurator().configure(viewController: self)
        tableView.register(CitiesTableCell.self, forCellReuseIdentifier: SearchPageViewController.cellID)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.load()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.prepare(for: segue, sender: sender)
    }
}


extension SearchPageViewController: SearchPagePresenterOutput {
    func showAlert(title: String?, message: String) {
        AlertSystem.alert(title: title, message: message)
    }
    
    func display(vm: SearchPageViewModel) {
        self.vm = vm
    }

    func showLoading() {
        loadIndicator.isLoading = true
    }

    func hideLoading() {
        loadIndicator.isLoading = false
    }

    func gotoWeatherDetails(area: Area) {
        router?.gotoWeatherDetails(area: area)
    }
}
