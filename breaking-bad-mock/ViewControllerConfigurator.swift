//
//  ViewController.swift
//  breaking-bad-mock
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import UIKit
import breaking_bad

class ViewControllerConfigurator : UIViewController {

    static func configure(view: ViewController) {
            let data = getJsonData(from: "response")
            let networkManager = FakeNetworkManager()
            networkManager.data = data
            let viewModel = ViewModel(networkManager: networkManager)
            view.setViewModel(viewModel)
        }
        
        static private func getJsonData(from name: String) -> Data {
            // get data from json file
            let bundle = Bundle(for: ViewControllerConfigurator.self)
            
            guard let file = bundle.url(forResource: name, withExtension: "json")
            else { return Data() }
            
            do {
                return try Data(contentsOf: file)
            } catch {
                return Data()
            }
        }

}

