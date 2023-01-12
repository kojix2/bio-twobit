require_relative "../reference_genome"

module Bio
  class TwoBit
    class ApiMel2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "apiMel2"
        @metadata.name = "apiMel2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/apiMel2/bigZips/apiMel2.2bit"
        super(**kwargs)
      end
    end
  end
end
