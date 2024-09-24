//
//  StockDetailsView.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/23/24.
//

import SwiftUI
import Combine

struct StockDetailsView: View {
    var stock: StockModel?
    var stockSingle: SingleStockModel?
    @ObservedObject var stockViewModel = StockViewModel()

    var body: some View {
        if let stock = stock {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(stockViewModel.stockDetails?[0].companyName ?? "N/A")
                                    .font(.largeTitle)
                                    .bold()
                                Text(stockViewModel.stockDetails?[0].symbol ?? "N/A")
                                    .font(.title2)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: stockViewModel.stockDetails?[0].image ?? "")) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                        // Highlight the current price and change
                        HStack {
                            Text(stockViewModel.stockDetails?[0].price?.description ?? "N/A")
                                .font(.largeTitle)
                                .bold()
                            Text(stockViewModel.stockDetails?[0].currency ?? "")
                                .font(.title2)
                            Spacer()
                            Text(stockViewModel.stockDetails?[0].changes?.description ?? "N/A")
                                .font(.title3)
                                .bold()
                                .foregroundColor(stockViewModel.stockDetails?[0].changes ?? 0 >= 0 ? .green : .red)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(stockViewModel.stockDetails?[0].changes ?? 0 >= 0 ? .green.opacity(0.2) : .red.opacity(0.2))
                                )
                        }

                        VStack(alignment: .leading) {
                        
                            HStack {
                                Text("Beta:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].beta?.description ?? "N/A")
                            }
                            HStack {
                                Text("Range:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].range ?? "N/A")
                            }
                            HStack {
                                Text("CEO:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].ceo ?? "N/A")
                            }
                            HStack {
                                Text("Address:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].address ?? "N/A")
                            }
                            HStack {
                                Text("City:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].city ?? "N/A")
                            }
                            HStack {
                                Text("State:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].state ?? "N/A")
                            }
                            HStack {
                                Text("Zip:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].zip ?? "N/A")
                            }
                        }

                        Divider()

                        Text(stockViewModel.stockDetails?[0].description ?? "N/A")
                            .font(.body)

                        Spacer()
                    }
                    .padding()
                }
                .navigationTitle(stockViewModel.stockDetails?[0].symbol ?? "Stock Details")
                .navigationBarTitleDisplayMode(.inline)

            }
            .onAppear {
                stockViewModel.getStockDetails(stockSymbol: stock.symbol ?? "")
            }

        } else if let singleStock = stockSingle {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(stockViewModel.stockDetails?[0].companyName ?? "N/A")
                                    .font(.largeTitle)
                                    .bold()
                                Text(stockViewModel.stockDetails?[0].symbol ?? "N/A")
                                    .font(.title2)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: stockViewModel.stockDetails?[0].image ?? "")) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius:
         10))
                        }

                        // Highlight the current price and change
                        HStack {
                            Text(stockViewModel.stockDetails?[0].price?.description ?? "N/A")
                                .font(.largeTitle)
                                .bold()
                            Text(stockViewModel.stockDetails?[0].currency ?? "")
                                .font(.title2)
                            Spacer()
                            Text(stockViewModel.stockDetails?[0].changes?.description ?? "N/A")
                                .font(.title3)
                                .bold()
                                .foregroundColor(stockViewModel.stockDetails?[0].changes ?? 0 >= 0 ? .green : .red)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(stockViewModel.stockDetails?[0].changes ?? 0 >= 0 ? .green.opacity(0.2) : .red.opacity(0.2))
                                )
                        }

                        VStack(alignment: .leading) {
                        
                            HStack {
                                Text("Beta:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].beta?.description ?? "N/A")
                            }
                            HStack {
                                Text("Range:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].range ?? "N/A")
                            }
                            HStack {
                                Text("CEO:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].ceo ?? "N/A")
                            }
                            HStack {
                                Text("Address:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].address ?? "N/A")
                            }
                            HStack {
                                Text("City:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].city ?? "N/A")
                            }
                            HStack {
                                Text("State:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].state ?? "N/A")
                            }
                            HStack {
                                Text("Zip:")
                                    .bold()
                                Spacer()
                                Text(stockViewModel.stockDetails?[0].zip ?? "N/A")
                            }
                        }

                        Divider()

                        Text(stockViewModel.stockDetails?[0].description ?? "N/A")
                            .font(.body)

                        Spacer()
                    }
                    .padding()
                }
                .navigationTitle(stockViewModel.stockDetails?[0].symbol ?? "Stock Details")
                .navigationBarTitleDisplayMode(.inline)

            }
            .onAppear {
                stockViewModel.getStockDetails(stockSymbol: singleStock.symbol ?? "")
            }
        }
    }
}

#Preview {
    StockDetailsView()
}

