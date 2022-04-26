//
//  ViewModel.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import Foundation
import Combine

public final class ViewModel {
    let networkManager : NetworkManagerProtocol
    @Published private(set) var characters : [Character] = []
    
    public init(networkManager : NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getCharacters(){
        networkManager.performRequest([Character].self, from: NetworkUrls.url) { [weak self] result in

            switch result {
            case .success(let characters) :
                self?.characters = characters
                
            case .failure(let error) :
                print(error.localizedDescription)
                print("succccccccesfrsakdfjsdfkjldsalf ")

                
            }
        }
    }
    
    
}
