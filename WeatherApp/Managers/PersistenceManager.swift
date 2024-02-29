//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 4.01.2024.
//

import Foundation

enum PersistenceActionType
{
    case Add,Remove
}
enum PersistenceManager
{
    static private let defaults = UserDefaults.standard
    
    enum Keys
    {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite : City, actionType : PersistenceActionType, completed : @escaping (WAError?) -> Void)
    {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                switch actionType {
                case .Add:
                    guard !retrievedFavorites.contains(where: {$0.name == favorite.name }) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrievedFavorites.append(favorite)
                case .Remove:
                    retrievedFavorites.removeAll { $0.name == favorite.name}
                }
                
                completed(save(favorites: retrievedFavorites))
            case .failure(let failure):
                completed(.unableToComplete)
            }
        }
    }
    static func retrieveFavorites(completed : @escaping (Result<[City],WAError>) -> ())
    {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else
        {
            completed(.success([]))
            return
        }
        
        do
        {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([City].self, from: favoritesData)
            completed(.success(favorites))
        }
        catch
        {
            completed(.failure(.unableToComplete))
            
        }
        
    }
    
    
    static func save(favorites : [City]) -> WAError?
    {
        do
        {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
            return nil
        }
        catch
        {
            return .unableToFavorite
        }
        
    }
    
}
