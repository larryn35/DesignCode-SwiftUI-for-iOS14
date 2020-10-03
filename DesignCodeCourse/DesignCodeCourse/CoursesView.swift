//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Larry Nguyen on 10/2/20.
//

import SwiftUI

struct CoursesView: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var content: some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
    }
    
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
