module Api
  class SpeciesController < ApiController
    def index
      render_paginated species, root_key: :species
    end

    private

    def species
      Species.all
    end
  end
end
