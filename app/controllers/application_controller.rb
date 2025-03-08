class ApplicationController < ActionController::API
        require 'will_paginate/array'

        include DeviseTokenAuth::Concerns::SetUserByToken
        
end
