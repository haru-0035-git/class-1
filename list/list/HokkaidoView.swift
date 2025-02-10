import SwiftUI

struct HokkaidoView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("Hokkaido") // ✅ 北海道のロゴ
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                
                Image("Hokkaido1") // ✅ 北海道の画像
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(10)
                    .padding()
                
                Text("大自然と豊かな食文化が魅力の北海道。")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("❄️ **北海道の歴史**")
                        .font(.headline)
                    Text("""
北海道は、アイヌ民族が古くから住んでいた地域です。明治時代以降、日本政府による開拓が進み、現在は農業や漁業が盛んな地域となっています。
""")
                    
                    Text("🏔 **観光名所**")
                        .font(.headline)
                    Text("""
- **札幌時計台**：北海道開拓の歴史を伝えるシンボル
- **小樽運河**：レトロな街並みが美しい観光スポット
- **函館夜景**：世界三大夜景の一つとして有名
- **富良野のラベンダー畑**：一面に広がる美しい紫の花畑
""")
                    
                    Text("🍣 **北海道のグルメ**")
                        .font(.headline)
                    Text("""
- 海鮮丼（新鮮なウニ・イクラ・カニがたっぷり）
- スープカレー（スパイスが効いた北海道名物のカレー）
- ジンギスカン（ラム肉を鉄板で焼く郷土料理）
""")
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle("北海道 - Hokkaido")
    }
}

struct HokkaidoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HokkaidoView()
        }
    }
}
