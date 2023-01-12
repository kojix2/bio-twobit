require_relative "../reference_genome"

module Bio
  class TwoBit
    class AilMel1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "ailMel1"
        @metadata.name = "ailMel1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/ailMel1/bigZips/ailMel1.2bit"
        super(**kwargs)
      end
    end
  end
end
