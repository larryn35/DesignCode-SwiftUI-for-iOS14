//
//  Sidebar.swift
//  DesignCodeCourse
//
//  Created by Larry Nguyen on 10/2/20.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("Learn")
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            #endif
            
            CoursesView()
        }
    }
    var content: some View {
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Livestreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
        }
        .listStyle(SidebarListStyle())
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
