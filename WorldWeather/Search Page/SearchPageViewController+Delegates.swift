//
//  SearchPageViewController+UITableView.swift
//  WorldWeather
//
//  Created by v.a.jayachandran on 10/12/19.
//  Copyright © 2019 v.a.jayachandran. All rights reserved.
//

import UIKit

//MARK: - UITableViewDataSource, UITableViewDelegate
extension SearchPageViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return vm?.tableTitle
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.cells.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchPageViewController.cellID, for: indexPath) as? CitiesTableCell else {
            return UITableViewCell()
        }

        cell.vm = vm?.cells[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.selectedArea(indexPath: indexPath)
    }
}

//MARK: - UITableViewDataSource, UISearchBarDelegate
extension SearchPageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output?.searchFieldTextChanged(text: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        output?.searchButtonClicked()
    }
}

