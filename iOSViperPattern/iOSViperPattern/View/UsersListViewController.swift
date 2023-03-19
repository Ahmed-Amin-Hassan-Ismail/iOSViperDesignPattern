//
//  ViewController.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import UIKit

class UsersListViewController: UIViewController {
    
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
    }
    
    private func setupTitle() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Users"
    }
    
}

extension UsersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        else {
            return UITableViewCell()
        }
        
        // configure cell...
        
        return cell
    }
    
}

extension UsersListViewController: UITableViewDelegate {
    
}

