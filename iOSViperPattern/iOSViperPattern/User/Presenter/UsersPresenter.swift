//
//  UserPresenter.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import Foundation


class UsersPresenter: UsersPresenterProtocol {
    
    //MARK: - Variables
    
    weak var view: UsersViewProtocol?
    private let interactor: UsersInteractorInputProtocol
    private let router: UsersRouterProtocol
    private var users: [User]?
    
    var numberOfRows: Int? {
        return users?.count ?? 0
    }
    
    //MARK: - Init
    
    init(view: UsersViewProtocol?, interactor: UsersInteractorInputProtocol, router: UsersRouterProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
        
    }
    
    //MARK: - Methods
    
    func viewDidLoad() {
        view?.showsActivityIndicator()
        interactor.getUsersData()
    }
    
    func configure(cell: UserTableViewCell, indexPath: IndexPath) {
        let user = users![indexPath.row]
        let viewModel = UserViewModel(user: user)
        cell.configure(viewModel: viewModel)
    }
    
}

 
extension UsersPresenter: UsersInteractorOutputProtocol {
    
    func fetchedUsersDataSuccessfully(users: [User]) {
        view?.hidesActivityIndicator()
        self.users = users
        view?.reloadData()
    }
    
    func fetchedUsersError(error: Error) {
        view?.hidesActivityIndicator()
    }
}
