import Foundation
import MapKit

class ViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    private let apiKey = "faeac792a8c5d4a6"
    
    func fetchRestaurants(for location: String) {
        guard !location.isEmpty else { return }
        
        let encodedLocation = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(apiKey)&keyword=\(encodedLocation)&count=10&format=json"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("エラー: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(HotPepperResponse.self, from: data)
                DispatchQueue.main.async {
                    self.restaurants = result.results.shop
                }
            } catch {
                print("JSON解析エラー: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func navigateToRestaurant(restaurant: Restaurant) {
        let destination = restaurant.address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let url = URL(string: "http://maps.apple.com/?daddr=\(destination)") {
            UIApplication.shared.open(url)
        }
    }
}
