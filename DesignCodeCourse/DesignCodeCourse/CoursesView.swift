//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Larry Nguyen on 10/2/20.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            CourseItem()
                .frame(width: 335, height: 250)
            VStack {
                if show {
                    CourseItem()
                        .transition(.move(edge: .trailing))
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
            withAnimation(.spring()) {
                show.toggle()
            }
        })
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
