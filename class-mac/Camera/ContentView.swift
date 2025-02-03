import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            VStack {
                // 上部に配置する検索欄
                TextField("駅名または地名を入力してください", text: $searchText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Spacer() // 検索結果リストを中央に配置するためのスペーサー
                
                // 検索結果リスト（空の場合のメッセージも含む）
                if viewModel.restaurants.isEmpty {
                    Text("ここに情報が表示されます")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.restaurants, id: \.id) { restaurant in
                        VStack(alignment: .leading) {
                            Text(restaurant.name)
                                .font(.headline)
                            Text(restaurant.address)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .onTapGesture {
                            viewModel.navigateToRestaurant(restaurant: restaurant)
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                }
                
                Spacer() // 検索ボタンを下部に配置するためのスペーサー
            }
            
            // 画面下部に固定された検索ボタン
            VStack {
                Spacer() // 検索ボタンを下部に配置
                Button(action: {
                    viewModel.fetchRestaurants(for: searchText)
                }) {
                    Text("検索")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .padding(.top)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
