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
                    SearchBar(text: $searchText, placeholder: "Search for stocks")
                        .onChange(of: searchText) { newSearchText in
                            // Cancel any existing search requests
                            searchCancellable?.cancel()
                            
                            // If the search text is empty, clear the results
                            if newSearchText.isEmpty {
                                stockViewModel.singleStockModel = nil
                                stockViewModel.isLoadingStockNameDone = true
                                return
                            }
                            
                            // Delay the API call for 2 seconds
                            searchCancellable = Timer.publish(every: 2, on: .main, in: .common)
                                .autoconnect()
                                .first()
                                .sink { _ in
                                    stockViewModel.isLoadingStockNameDone = true
                                    stockViewModel.getStock(stockSymbol: newSearchText)
                                }
                        }
                    
                    if stockViewModel.isLoadingStockNameDone {
                        List(stockViewModel.stockModel ?? [], id: \.name) { stock in
                            NavigationLink(destination: StockDetailsView(stock: stock)) {
                                VStack(alignment: .leading) {
                                    Text("\(stock.name ?? "NA")")
                                        .bold()
                                    Text("\(stock.symbol ?? "NA")")
                                        .font(.footnote)
                                } }
                        }
                    } else if stockViewModel.isLoadingStockListDone {
                        List(stockViewModel.singleStockModel ?? [], id: \.name) { stock in
                            NavigationLink(destination: StockDetailsView(stockSingle: stock)) {
                                VStack(alignment: .leading) {
                                    Text("\(stock.name ?? "NA")")
                                        .bold()
                                    Text("\(stock.symbol ?? "NA")")
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                }
                .padding()
                .onAppear {
                    stockViewModel.getStockList()
                }
            }
        })
    }
}


#Preview {
    ContentView()
}
