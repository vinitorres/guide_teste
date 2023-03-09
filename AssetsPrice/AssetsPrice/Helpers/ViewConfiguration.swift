//
//
// Created by André Vinícius Torres Conrado
//

protocol ViewConfiguration {
    
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewConfiguration {
        
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
}
