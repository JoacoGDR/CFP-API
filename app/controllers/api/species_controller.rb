module Api
  class SpeciesController < ApiController
    def index
      render_paginated species, root_key: :species, serializer: SpeciesSerializer
    end

    private

    def species
      Species.all
    end
  end
end
