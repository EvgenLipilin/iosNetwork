
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
    

    static func login (username: String, password: String, completion: @escaping(Int,Data)-> Void ) {
        
        let stringURL = "https://api.github.com/user"
        
        let loginString = String(format: "%@:%@", username, password)
        guard let dataLoginString = loginString.data(using: .utf8) else { return }
        let base64LoginString = dataLoginString.base64EncodedString()
        
        guard let url = URL(string: stringURL) else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            var statusCode = 200
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("http status code: \(httpResponse.statusCode)")
                statusCode = httpResponse.statusCode
            }
            
            guard let jsonData = data else {
                print("No data received")
                return
            }
            
            completion(statusCode, jsonData)
        }.resume()
    }
    
}
