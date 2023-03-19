//
//  UsersRouter.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import UIKit


class UsersRouter: UsersRouterProtocol {
    
    weak var viewController: UIViewController?
    
    // responsible to create module
    
    static func createModule() -> UIViewController {
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UsersListViewController".self) as! UsersListViewController
        
        let interactor = UsersInteractor()
        
        let router = UsersRouter()
        router.viewController = view
        
        let presenter = UsersPresenter(view: view,
                                       interactor: interactor,
                                       router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
