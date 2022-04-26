//
//  ViewController.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    
    private var subscribers = Set<AnyCancellable>()
    private let viewModel = ViewModel(networkManager: NetworkManager())
    
    private var characterViewModels : [Character] = []
    
    private lazy var tableView : UITableView = {
        let table = UITableView()
        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 150
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        dataBinding()
    }


}

//MARK: - Functions
extension MainViewController {
    private func setup(){
        navigationItem.title = "Breaking Bad Characters"
        view.addSubview(tableView)
    }
    
    private func layout(){
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func dataBinding(){

        viewModel
            .$characters.receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] characters in
                self?.characterViewModels = characters
                self?.tableView.reloadData()
            })
            .store(in: &subscribers)
        
        getCharacters()
    }
    
    private func getCharacters() {
        viewModel.getCharacters()
        
    }
    
    private func navigateToDetail(model : Character){
        let detailVC = DetailViewController(model: model)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    

    
}


//MARK: - UITableViewDelegate & UITableViewDataSource
extension MainViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath)
        as? CharacterTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(model: characterViewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigateToDetail(model: characterViewModels[indexPath.row])
    }
    
    
}

