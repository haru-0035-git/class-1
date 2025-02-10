import SwiftUI

struct KyotoView: View {
    var body: some View {
        ScrollView {
            VStack {
                // ✅ ロゴとタイトルを横並び
                    Image("Kyoto") // ✅ ロゴ画像
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                
                Image("Kyoto1") // ✅ 京都の画像
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(10)
                    .padding()
                
                Text("日本の歴史と文化が息づく古都、京都。")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("🏯 **京都の歴史**")
                        .font(.headline)
                    Text("""
京都は794年に平安京として日本の首都となり、約1000年間にわたり政治・文化の中心地でした。今でも多くの歴史的建造物が残っており、世界遺産にも登録されています。
""")
                    
                    Text("🌸 **観光名所**")
                        .font(.headline)
                    Text("""
- **清水寺**：美しい木造の舞台と桜・紅葉の景色で有名
- **金閣寺**：黄金に輝く美しい寺院
- **伏見稲荷大社**：千本鳥居で有名な神社
- **嵐山**：竹林や渡月橋が魅力の自然スポット
""")
                    
                    Text("🍵 **京都のグルメ**")
                        .font(.headline)
                    Text("""
- 抹茶スイーツ（宇治の抹茶を使ったスイーツが人気）
- 京懐石（美しい盛り付けと繊細な味わい）
- 湯豆腐（京都の名物、ヘルシーで上品な味）
""")
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle("京都 - Kyoto")
    }
}

struct JapanView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            KyotoView()
        }
    }
}
