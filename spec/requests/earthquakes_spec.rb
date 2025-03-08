# require "swagger_helper"

# describe "Earthquakes API" do
#     path "/api/v1/earthquakes" do
#         post "Creates a Earthquake" do
#             tags "Earthquakes Information"
#             consumes "application/json"
#             parameter name: :earthquake, in: :body, schema: {
#                 type: :object,
#                 properties: {
#                     date: { type: :date},
#                     time: { type: :time},
#                     latitude: { type: :float},
#                     longitude: { type: :float},
#                     location: { type: :string},
#                     depth: { type: :float}
#                 }
#                 required: ["location"]
#             }
#             response "201", "Earthquake Information created" do
#                 let(:earthquake) { {location: "new earthquake"}}
#                 run_test!
#             end

#             response "422", "invalid request" do
#                 let(:earthquake) { {}}
#                 run_test!
#             end
#         end
#     end
# end






require 'swagger_helper'

RSpec.describe 'api/v1/earthquakes', type: :request do
  path '/api/v1/earthquakes' do
    post 'Creates an Earthquake' do
      tags 'Earthquakes'
      consumes 'application/json'
      parameter name: :earthquake, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: 'date' },
          time: { type: :string, format: 'time' },
          latitude: { type: :number },
          longitude: { type: :number },
          location: { type: :string },
          depth: { type: :number }
        },
        required: ['date', 'time', 'latitude', 'longitude', 'location', 'depth']
      }

      response '201', 'earthquake created' do
        let(:earthquake) { { date: '2023-08-06', time: '12:34:56', latitude: 45.0, longitude: -122.0, location: 'Test Location', depth: 10.0 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:earthquake) { { date: '2023-08-06' } }
        run_test!
      end
    end
  end
end
