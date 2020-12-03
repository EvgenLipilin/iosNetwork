
import Foundation

class NetworkManager {
    
    static func searchRepositoryWithoutSort(urlResponse: String, repoName: String, language: String, completion: @escaping (_ model: Repository) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language
        guard let url = URL(string: urlForSearch) else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print(error!.localizedDescription)
                return }
            
            do {
                let json = try JSONDecoder().decode(Repository.self, from: data)
                completion(json)
                
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
            
        } .resume()
    }
    
    static func searchRepositoryWithSort(urlResponse: String, repoName: String, language: String, sort: String, completion: @escaping (_ model: Repository) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language + sort
        guard let url = URL(string: urlForSearch) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print(error!.localizedDescription)
                return }
            
            do {
                let json = try JSONDecoder().decode(Repository.self, from: data)
                completion(json)
                
            } catch {
                print(error.localizedDescription)
            }
        } .resume()
    }
    
}
