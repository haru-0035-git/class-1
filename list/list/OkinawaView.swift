import SwiftUI

struct OkinawaView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("Okinawa") // ✅ 沖縄のロゴ
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                
                Image("Okinawa1") // ✅ 沖縄の画像
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(10)
                    .padding()
                
                Text("美しい海と独自の文化を持つ南国、沖縄。")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("🏝 **沖縄の歴史**")
                        .font(.headline)
                    Text("""
沖縄は琉球王国として独自の文化を育んできました。戦後はアメリカの統治下にあり、1972年に日本へ返還されました。独特の歴史と文化が今も息づいています。
""")
                    
                    Text("🌊 **観光名所**")
                        .font(.headline)
                    Text("""
- **首里城**：琉球王国の歴史を伝える世界遺産
- **美ら海水族館**：巨大な水槽でジンベエザメが泳ぐ人気スポット
- **古宇利島**：エメラルドグリーンの海に囲まれた絶景スポット
- **国際通り**：沖縄のグルメやお土産が楽しめる賑やかな通り
""")
                    
                    Text("🍍 **沖縄のグルメ**")
                        .font(.headline)
                    Text("""
- ゴーヤチャンプルー（ゴーヤと豆腐、豚肉の炒め物）
- ソーキそば（沖縄風のだしが効いたそば）
- 海ぶどう（プチプチ食感が楽しい海藻）
""")
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle("沖縄 - Okinawa")
    }
}

struct OkinawaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OkinawaView()
        }
    }
}
