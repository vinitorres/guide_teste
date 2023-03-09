//
//
// Created by André Vinícius Torres Conrado
//

class HomeViewModel {
    
    private let assetsSymbols: [String] = ["PETR4.SA", "AMER3.SA", "BBAS3.SA", "ITUB4.SA", "BBDC4.SA"]
    
    func getNumberOfAssets() -> Int {
        return assetsSymbols.count
    }
    
    func getAssetForIndex(index: Int) -> String {
        return assetsSymbols[index]
    }
    
}
