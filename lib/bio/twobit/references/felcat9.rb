require_relative "../reference_genome"

module Bio
  class TwoBit
    class FelCat9 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "felCat9"
        @metadata.name = "felCat9"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/felCat9/bigZips/felCat9.2bit"
        super(**kwargs)
      end
    end
  end
end
