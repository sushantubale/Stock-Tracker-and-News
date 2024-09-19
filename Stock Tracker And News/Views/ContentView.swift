//
//  ContentView.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var stockViewModel = StockViewModel()
    @State private var searchText = ""
    @State private var searchCancellable: AnyCancellable?

    var body: some View {
        GeometryReader(content: { geometry in
            NavigationView {
                VStack {
                    // Search bar
                    SearchBar(text: $searchText, placeholder: "Search for stocks")
                        .onChange(of: searchText) { newSearchText in
                            // Cancel any existing search requests
                            searchCancellable?.cancel()

                            // If the search text is empty, clear the results
                            if newSearchText.isEmpty {
                                stockViewModel.stockModel = nil
                                return
                            }

                            // Delay the API call for 2 seconds
                            searchCancellable = Timer.publish(every: 2, on: .main, in: .common)
                                .autoconnect()
                                .first() // Take only the first value emitted by the timer
                                .sink { _ in
                                    stockViewModel.getStock(stockSymbol: newSearchText)
                                }
                        }

                    // Display search results
                    if let stockModel = stockViewModel.stockModel {
                        List(stockModel, id: \.name) { value in
                            HStack {
                                Text(value.name ?? "NA")
                                Text(value.symbol ?? "NA")
                            }
                        }
                        .navigationTitle("Stock Tracker and News")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                    Spacer()
                }
                .padding()
                .frame(height: geometry.size.height/2)
            }
        })
    }
}


#Preview {
    ContentView()
}
