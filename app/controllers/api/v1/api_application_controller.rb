class Api::V1::ApiApplicationController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    protect_from_forgery with: :null_session

end