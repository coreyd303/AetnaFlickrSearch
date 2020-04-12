//
//  FlickrSearchViewController.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

protocol FlickrSearchPresentable: Presentable {
    var didFinish: (() -> Void)? { get set }
    var didSelectItem: ((FlickrItem) -> Void)? { get set }
    
    var viewModel: FlickrSearchViewModel? { get set }
}

class FlickrSearchViewController: UIViewController, FlickrSearchPresentable {
    
    // MARK: - Properties

    var didFinish: (() -> Void)?
    var didSelectItem: ((FlickrItem) -> Void)?
    var viewModel: FlickrSearchViewModel?
    
    var tableView: UITableView!
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        applyDesign()
        setup()
    }
    
    private func applyDesign() {
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.backgroundColor = .white
    }
    
    private func setup() {
        tableView?.delegate = self
        tableView?.dataSource = self
        searchBar?.delegate = self
    }
}

extension FlickrSearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: - may want to set a height here or allow for a more dynamic set up using cell contents
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = viewModel?.items[indexPath.row] else { return }
        
        didSelectItem?(item)
    }
}

extension FlickrSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.items[indexPath.row] else { return UITableViewCell() }
        
        let cell = FlickrSearchCell()
        cell.configure(with: item)
        
        return cell
    }
    
    
}

extension FlickrSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.search(for: searchBar.text ?? "")
    }
}

extension FlickrSearchViewController: FlickrSearchDelegate {
    func didUpdateItems() {
        // TODO: - update related rows based on new items in viewModel.items
        tableView.reloadData()
    }
}
