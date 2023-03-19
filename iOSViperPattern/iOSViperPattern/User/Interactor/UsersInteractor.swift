//
//  UsersInteractor.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import Foundation
import Alamofire


class UsersInteractor: UsersInteractorInputProtocol {
    
    //MARK: - Variables
    
    weak var presenter: UsersInteractorOutputProtocol?
    
    func getUsersData() {
        getUsers { result in
            switch result {
            case .success(let success):
                presenter?.fetchedUsersDataSuccessfully(users: success)
            case .failure(let failure):
                presenter?.fetchedUsersError(error: failure)
            }
        }
        
    }
    
    //MARK: - Api calling
    
    private func getUsers(completion: ( Result<[User], Error> ) -> Void ) {
        
        guard let url = URL(string: "https://api.myjson.com/bins/ozuf8") else { return }
        
        AF.request(url, method: .get).validate().responseJSON(completionHandler: { response in
            
            
            switch response.result {
            case .success(let value):
                guard let users = value as? [User] else {
                    print("error while down casting")
                    return
                }
                print(users)
                
            case .failure(let error):
                print("returning error, ", error.localizedDescription)
            }
            
        })
    }
}
