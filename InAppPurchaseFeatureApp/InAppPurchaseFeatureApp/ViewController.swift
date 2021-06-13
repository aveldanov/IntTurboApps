//
//  ViewController.swift
//  InAppPurchaseFeatureApp
//
//  Created by Anton Veldanov on 6/13/21.
//

import UIKit
import StoreKit


class ViewController: UIViewController, SKProductsRequestDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let productIds : Set<String> = ["com.aveldanov.InAppPurchaseFeatureApp.item"]
        let prodReq = SKProductsRequest(productIdentifiers: productIds)
        prodReq.delegate = self
        prodReq.start()
    }
    
    
    @IBAction func buyBtnClicked(_ sender: UIButton) {
        
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("loaded products")
        print(response.invalidProductIdentifiers)
        for product in response.products{
            
            print("Product: \(product.productIdentifier) \(product.localizedTitle) \(product.price.floatValue)" )
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        debugPrint(error)
    }

}

