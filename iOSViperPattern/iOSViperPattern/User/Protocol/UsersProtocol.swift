//
//  UsersProtocol.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import Foundation


protocol UsersViewProtocol: AnyObject {
    
    var presenter: UsersPresenterProtocol? { get set }
    
    func showsActivityIndicator()
    func hidesActivityIndicator()
    func reloadData()
}

protocol UsersPresenterProtocol: AnyObject {
    
    var view: UsersViewProtocol? { get set }
    var numberOfRows: Int? { get }
    
    func viewDidLoad()
    func configure(cell: UserTableViewCell, indexPath: IndexPath )
    
}

protocol UsersRouterProtocol: AnyObject {
    
}

protocol UsersInteractorInputProtocol: AnyObject {
    
    var presenter: UsersInteractorOutputProtocol? { get set }
    
    func getUsersData()
}

protocol UsersInteractorOutputProtocol: AnyObject {
    
    func fetchedUsersDataSuccessfully(users: [User])
    func fetchedUsersError(error: Error)
}

protocol UsersTableViewCellProtocol {
    
    func configure(viewModel: UserViewModel)
}
