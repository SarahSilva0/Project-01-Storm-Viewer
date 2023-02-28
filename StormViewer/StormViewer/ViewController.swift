//
//  ViewController.swift
//  StormViewer
//
//  Created by Sarah dos Santos Silva on 27/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures = [String]()
    var tableViewVM: TableViewStorm?
    
    override func loadView() {
        self.tableViewVM = TableViewStorm()
        self.view = self.tableViewVM
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer" //navigation title
        navigationController?.navigationBar.prefersLargeTitles = true
        loadFile()
        tableViewVM?.tableView.dataSource = self
        tableViewVM?.tableView.delegate = self
    }
    
    private func loadFile(){
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // Nesse caso, estou falando que quero procurar arquivos no pacote principal da aplicação
        let items = try! fm.contentsOfDirectory(atPath: path) //será um array de strings contendo nomes de arquivos
        
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
                pictures.sort() // organizando o array
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = DetailStormController()
//        nextVC.modalTransitionStyle = .coverVertical // NECESSÁRIO PARA CHAMAR A VIEW SEM NAVIGATION
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.selectedImage = pictures[indexPath.row]
        nextVC.selectedPictureNumber = indexPath.row + 1 // só para não inicializar no zero
        nextVC.totalPictures = pictures.count
//        self.present( nextVC,  animated: true,  completion: nil) DESSA FORMA EU CHAMO A VIEW **SEM** A NAVIGATION CONTROLLER
        navigationController?.pushViewController(nextVC, animated: true)

    }
    
    
}

