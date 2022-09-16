//
//  HomeViewModelTests.swift
//  LeaguesTests
//
//  Created by Wilson David Molina Lozano on 8/09/22.
//

import XCTest
@testable import Leagues

class HomeViewModelTests: XCTestCase {
    
    var sutViewmodel: HomeViewModel!
    var sutManager: HomeManagerProtocol!
    var sutRouter: HomeRouter!
    
    // Se ejecuta el número de pruebas que se tengan antes de la prueba en cuestión
    override func setUpWithError() throws {
        sutManager = HomeManagerMock()
        sutRouter = HomeRouter()
        sutViewmodel = HomeViewModel(manager: sutManager, router: sutRouter)
    }

    // Se utiliza para limpiar las variables
    override func tearDownWithError() throws {
        sutViewmodel = nil
        sutManager = nil
        sutRouter = nil
    }

    // Prueba
    func testGetqLeagues() {
        sutViewmodel.getLeagues()
        
        XCTAssertTrue(sutViewmodel.leagues.count > 0)
    }

}

class HomeManagerMock: HomeManagerProtocol {
    
    func getLeagues(completionHandler: @escaping ((Result<LeagueResponse, Error>) -> Void)) {
        completionHandler(.success(LeagueResponse(leagues: [League(name: "L", sport: "S")])))
    }
    
}
