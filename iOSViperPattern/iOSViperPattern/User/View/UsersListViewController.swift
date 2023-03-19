//
//  ViewController.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import UIKit

class UsersListViewController: UIViewController, UsersViewProtocol {
    
    //MARK: - Variables
    
    var presenter: UsersPresenterProtocol?
    private var activityIndicator: UIActivityIndicatorView?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            let nib = UINib(nibName: "UserTableViewCell".self, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
        }
    }
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        presenter?.viewDidLoad()
    }
        
    //MARK: - Methods
    
    private func setupTitle() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Users"
    }
    
    func showsActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        view.addSubview(activityIndicator!)
        activityIndicator!.showsLargeContentViewer = true
        activityIndicator!.startAnimating()
    }
    
    func hidesActivityIndicator() {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension UsersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        else {
            return UITableViewCell()
        }
        
        presenter?.configure(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
}

extension UsersListViewController: UITableViewDelegate {
    
}

