require_relative "../reference_genome"

module Bio
  class TwoBit
    class TupBel1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "tupBel1"
        @metadata.name = "tupBel1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/tupBel1/bigZips/tupBel1.2bit"
        super(**kwargs)
      end
    end
  end
end
