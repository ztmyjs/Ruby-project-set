class StaticPagesController < ApplicationController
    def home
        @presentations = Presentation.all
    end
end
