//
//  NewsTable.swift
//  TestProjectSwiftUI
//
//  Created by Олег Алексеев on 20.09.2023.
//

import SwiftUI

struct NewsTable: View {
    @State var news = [News]()

    var body: some View {
        List(news, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                Text(item.formattedDate)
                    .font(.footnote)

            }
            .padding()
        }
        .onAppear {
            DispatchQueue.main.async {
                NetworkService().getNews { news in
                    self.news = news
                }
            }
        }
    }
}

#Preview {
    NewsTable()
}
