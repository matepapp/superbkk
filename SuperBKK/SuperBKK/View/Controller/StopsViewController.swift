//
//  StopsViewController.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController, NIBLoadableView {
    private var viewModel: StopsViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    required convenience init(viewModel: StopsViewModel) {
        self.init(nibName: StopsViewController.nibName, bundle: nil)
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: StopTableViewCell.nibName, bundle: nil),
                                forCellReuseIdentifier: StopTableViewCell.defaultReuseIdentifier)
        
        self.title = self.viewModel.title
        
        self.bindToViewModel()
        self.getData()
    }
    
    private func getData() {
        self.viewModel.getStopsData()
    }
    
    private func bindToViewModel() {
        self.viewModel.didUpdate = { [weak self] view in
            self?.viewModelDidUpdate()
        }
        self.viewModel.didError = { [weak self] errorMessage in
            self?.viewModelDidError(message: errorMessage)
        }
    }
    
    private func viewModelDidUpdate() {
        self.title = self.viewModel.title
        self.tableView.reloadData()
    }
    
    private func viewModelDidError(message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)

        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}

extension StopsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.stopsViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StopTableViewCell.defaultReuseIdentifier, for: indexPath) as? StopTableViewCell {
            
            if let stopViewModel = self.viewModel.stopsViewModel?[indexPath.row] {
                cell.configure(with: stopViewModel)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension StopsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: - Implement navigation based on the selected StopViewModell
    }
}
