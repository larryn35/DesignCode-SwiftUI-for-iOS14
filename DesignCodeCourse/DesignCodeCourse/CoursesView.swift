//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Larry Nguyen on 10/2/20.
//

import SwiftUI

struct CoursesView: View {
    @Namespace var namespace
    @State var show = false
    @State var selectedItem: Course? = nil
    @State var isDisabled = false // disable cards while transition-out is occuring
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 160), spacing: 16)
                ],
                spacing: 16
                ) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(height: 200)
                            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                withAnimation(.spring()) {
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            })
                            .disabled(isDisabled)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            if selectedItem != nil {
                ScrollView {
                    CourseItem(course: selectedItem!) // can force unwrap due to if selectedItem != nil conditional
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height: 300)
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            withAnimation(.spring()) {
                                show.toggle()
                                selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isDisabled = false
                                }
                            }
                        })
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion:
                            AnyTransition
                            .opacity
                            .animation(Animation.spring()
                                        .delay(0.3)),
                        removal:
                            AnyTransition
                            .opacity
                            .animation(.spring())
                    )
                )
                .edgesIgnoringSafeArea(.all)
            }
            
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
