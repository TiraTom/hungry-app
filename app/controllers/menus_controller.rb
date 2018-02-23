class MenusController < ApplicationController
    include MenusHelper
    def index
    end

    def getMenu
        @menu_info = get_menu_info
        render :index
    end

end
