//
//  HousingView.swift
//  Roomie 2024
//
//

import SwiftUI

struct HousingView: View {
    
    // Application status
    @Binding var applicationStatus: String
    
    // URL links for more housing information
    let housingInfoURL = "https://inside.manhattan.edu/student-life/residence-life/Cable%20TV,%20Internet%20and%20Wireless.php"
    let housingQAURL = "https://inside.manhattan.edu/student-life/residence-life/questions.php"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Housing Information")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundStyle(.purple)
                    
                    Text("Living on campus in one of our five residence halls is an important part of the full university experience. Your floormates will become your second family — a network of friends who you'll bond with over shared meals, late night study sessions and Netflix binges.")
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)

                    
                    Text("Each of our residence halls has a resident director, a staff member who coordinates residence life programming and oversees the resident assistants, better known as RAs. RAs are students, typically upperclassmen, who live on each floor of the hall and serve as a liaison and resource for the residents. RAs plan regular activities, like game night and trips to popular New York City destinations, to create a bonded community on their floor.")
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)

                    
                    Text("Traditional Residence Halls")
                        .padding(.horizontal)
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.heavy)
                        .background(.purple)
                        .foregroundStyle(.white)
                    
                    Text("Chrysostom Hall")
                        .padding(.horizontal)
                        .font(.system(.title3, design: .rounded))

                    
                    Text("Chrysostom Hall, renovated in the fall of 2022, houses approximately 60 continuing students in our singles-only building. As a resident of Chrysostom, you’ll be able to take advantage of the quiet study spaces and newly renovated common areas in order to focus on your studies while still remaining in the heart of campus life.")
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)
                    
                    Text("Jasper Hall")
                        .font(.system(.title3, design: .rounded))
                        .padding(.horizontal)
                    
                    Text("Jasper Hall houses approximately 120 students on five floors. It is open to all graduate students and veteran students who wish to live in single-style accommodations. Living in Jasper is like living with your second family. It has a communal kitchen and two large social and gaming rooms that have a variety of activity, study and entertainment spaces. Jasper Hall is also our only community to offer 12-month housing. Contracts for the full academic year run from August-August and include all break periods. Graduate and Veteran students living in Jasper Hall are not required to participate in the meal plan program, but may choose any of the available meal plans should they desire.This provides a level of flexibility and autonomy that can be ideal for those pursuing graduate degrees or who may be older than our typical undergraduate student.")
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)
                    
                    Text("Suites")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                        .background(.purple)
                        .foregroundStyle(.white)
                    
                    Text("Horan & Lee Halls")
                        .font(.system(.title3, design: .rounded))
                        .padding(.horizontal)
                    
                    Text("Horan Hall houses approximately 400 students in suite style rooms with freshly updated bathrooms. Lee Hall is home to approximately 550 students on 10 floors. Lee Hall is home to all of our first-year students, while Horan houses our continuing and transfer students.Lee Hall is home to our first-year living and learning community, the Arches. All of these residence communities are different but they each provide an opportunity to forge new friendships and participate in special programs and excursions.")
                        .font(.body)
                        .padding(.horizontal)
                    
                    Text("Apartments")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                        .background(.purple)
                        .foregroundStyle(.white)
                    
                    Text("Our apartments are a great option for students who are ready for more independent living but want to maintain the benefits that come with campus housing, and avoid dealing with private landlords. Horan Hall has more than 40 apartments that can house more than 180 juniors, seniors and graduate students. Most floors have a three-person, two five-person, and one six-person apartment. Each unit is fully furnished and includes a full kitchen and one or two bathrooms, a living room, and dining space.")
                        .font(.body)
                        .padding(.horizontal)
                    
                    // External Link Button
                    Link("Read More About Housing Policies", destination: URL(string: housingInfoURL)!)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    // External Link Button
                    Link("Frequently Asked Questions", destination: URL(string: housingQAURL)!)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    // Initial Application Status
                    Text(applicationStatus)
                        .font(.body)
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // Button to navigate to the housing application form
                    NavigationLink(destination: HousingApplicationForm()) {
                        Text("Apply for Housing")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                //.navigationBarTitle("Housing Information", displayMode: .inline)
                .padding()
            }
        }
    }
}

#Preview {
    // Initialize Application Status
    @State var initial_status: String = "Status: Your application status will be updated once you submit your application."
    
    HousingView(applicationStatus: $initial_status)
}

