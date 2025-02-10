import SwiftUI

struct ContentView: View {
    @State private var showList = false // ✅ ボタンを押すとリストが表示される
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer() // ✅ 上下の余白を調整
                
                Text("日本旅行プラン")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Image("Travel") // ✅ 旅行イメージ画像（Assets に追加）
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
                
                Button(action: {
                    withAnimation { showList.toggle() } // ✅ アニメーション付きでリストを表示
                }) {
                    Text(showList ? "リストを閉じる" : "旅行案を出す")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                
                if showList {
                    List {
                        Section(header: Text("おすすめの旅行先").font(.headline)) {
                            NavigationLink(destination: KyotoView()) {
                                HStack {
                                    Image(systemName: "leaf.fill")
                                        .foregroundColor(.green)
                                    Text("京都")
                                        .font(.title2)
                                }
                                .padding(.vertical, 5)
                            }
                            .listRowBackground(Color(.systemGray6))
                            
                            NavigationLink(destination: OkinawaView()) {
                                HStack {
                                    Image(systemName: "sun.max.fill")
                                        .foregroundColor(.orange)
                                    Text("沖縄")
                                        .font(.title2)
                                }
                                .padding(.vertical, 5)
                            }
                            .listRowBackground(Color(.systemGray6))
                            
                            NavigationLink(destination: HokkaidoView()) {
                                HStack {
                                    Image(systemName: "snowflake")
                                        .foregroundColor(.blue)
                                    Text("北海道")
                                        .font(.title2)
                                }
                                .padding(.vertical, 5)
                            }
                            .listRowBackground(Color(.systemGray6))
                        }
                    }
                    .listStyle(.insetGrouped)
                    .frame(height: 300) // ✅ リストの高さを制限してデザイン調整
                    .padding(.top, 10)
                }
                
                Spacer()
            }
            .navigationTitle("旅行提案")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
