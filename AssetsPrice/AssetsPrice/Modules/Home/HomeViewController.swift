//
//
// Created by André Vinícius Torres Conrado
//


import UIKit
import Flutter

class HomeViewController: UIViewController {
    
    var customView: HomeView?
    var viewModel: HomeViewModel?
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView?.setupAssetsTableProtocols(delegate: self, dataSource: self)
    }
    
    static func assembleModule() -> UIViewController {
        let viewController = HomeViewController()
        let viewModel = HomeViewModel()
        let customView = HomeView()
        viewController.viewModel = viewModel
        viewController.customView = customView
        return viewController
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfAssets() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.textLabel?.text = viewModel?.getAssetForIndex(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let selectedSymbol = viewModel?.getAssetForIndex(index: indexPath.row)
        
        flutterEngine.viewController = nil
        
        let flutterViewController = FlutterViewController(
          engine: flutterEngine,
          nibName: nil,
          bundle: nil)
        
        let channel = FlutterMethodChannel(name: "channel", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)


        channel.invokeMethod("sendSymbol", arguments: selectedSymbol)
        
        self.navigationController?.show(flutterViewController, sender: self)
    }
    
}

