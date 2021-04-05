//
//  ContentView.swift
//  MovieAppUsingFR
//
//  Created by admin on 05.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Movie.byRating) var movies: FetchedResults<Movie>
    
    @State private var movieName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Movie Name", text: $movieName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        let movie = Movie(context: viewContext)
                        movie.title = movieName
                        movie.rating = Int16.random(in: 1...5)
                        try? viewContext.save()
                        movieName = ""
                    }, label: {
                        Text("Add movie")
                    })
                }
                List(movies, id: \.self) { movie in
                    HStack {
                        Text(movie.title ?? "")
                        Spacer()
                        
                        HStack {
                            Text("\(movie.rating)")
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Movies")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
