class MenusController < ApplicationController
    include MenusHelper
    def index
        doc = getPage
    end
    
end
