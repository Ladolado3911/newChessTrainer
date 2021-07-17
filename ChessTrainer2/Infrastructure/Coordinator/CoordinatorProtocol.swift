//
//  CoordinatorProtocol.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
//    var networkManger: NetworkManagerProtocol? { get }
//    var homeServiceManager: HomeServicesManagerProtocol? { get }
        
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proceedToProducts()
    func proceedToProductDetails(with data: String)
    func openSuccessAlert()
}

extension CoordinatorProtocol {
//
//    var networkManger: NetworkManagerProtocol? {
//        set { print("") }
//        get { nil }
//    }
//
//    var homeServiceManager: HomeServicesManagerProtocol? {
//        set { print("") }
//        get { nil }
//    }
    
    func proceedToProducts() {
        print("I am default implemented")
    }
    
    func proceedToProductDetails(with data: String) {}
    func openSuccessAlert() {}
}
