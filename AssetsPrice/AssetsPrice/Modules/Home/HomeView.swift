//
//
// Created by André Vinícius Torres Conrado
//


import UIKit

class HomeView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Selecione um ativo para consultar o historico de valores"
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var assetsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAssetsTableProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        assetsTable.delegate = delegate
        assetsTable.dataSource = dataSource
    }
    
}

extension HomeView: ViewConfiguration {
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor.groupTableViewBackground
    }
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(assetsTable)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            
            assetsTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            assetsTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            assetsTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            assetsTable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 20),

        ])
    }
    
}
