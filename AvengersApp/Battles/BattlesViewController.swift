//
//  BattlesViewController.swift
//  AvegersApp
//
//  Created by Eva Gonzalez Ferreira on 19/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class BattlesViewController: UIViewController {

    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var newBattleOutlet: UIButton!
    
    let viewModel: BattlesViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewWasLoaded()
    }
    
    init(viewModel: BattlesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        tableViewOutlet.register(UINib(nibName: "BattleViewCell", bundle: nil), forCellReuseIdentifier: "BattleViewCell")
        tableViewOutlet.estimatedRowHeight = 201
        tableViewOutlet.rowHeight = UITableView.automaticDimension
    }

}

extension BattlesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BattleViewCell", for: indexPath) as? BattleViewCell,
            let cellViewModel = viewModel.viewModel(at: indexPath) {
            cell.viewModel = cellViewModel
            return cell
        }

        fatalError()
    }
}

extension BattlesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectRow(at: indexPath)
    }
}

//extension BattlesViewController: BattlesViewDelegate {
//    func topicsFetched() {
//        tableView.reloadData()
//    }
//
//    func errorFetchingTopics() {
//        showErrorFetchingTopicsAlert()
//    }
//}
